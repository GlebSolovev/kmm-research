/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.fir.backend

import org.jetbrains.kotlin.descriptors.*
import org.jetbrains.kotlin.fir.declarations.*
import org.jetbrains.kotlin.fir.declarations.utils.*
import org.jetbrains.kotlin.fir.expressions.FirAnonymousObjectExpression
import org.jetbrains.kotlin.fir.resolve.providers.firProvider
import org.jetbrains.kotlin.fir.resolve.providers.toSymbol
import org.jetbrains.kotlin.fir.resolve.toSymbol
import org.jetbrains.kotlin.fir.symbols.ConeClassLikeLookupTag
import org.jetbrains.kotlin.fir.symbols.impl.FirClassSymbol
import org.jetbrains.kotlin.fir.symbols.impl.FirTypeParameterSymbol
import org.jetbrains.kotlin.fir.types.FirTypeRef
import org.jetbrains.kotlin.fir.types.toLookupTag
import org.jetbrains.kotlin.ir.UNDEFINED_OFFSET
import org.jetbrains.kotlin.ir.declarations.*
import org.jetbrains.kotlin.ir.symbols.*
import org.jetbrains.kotlin.ir.symbols.impl.*
import org.jetbrains.kotlin.ir.types.IrType
import org.jetbrains.kotlin.name.Name
import org.jetbrains.kotlin.name.SpecialNames
import org.jetbrains.kotlin.name.StandardClassIds

class Fir2IrClassifierStorage(
    private val components: Fir2IrComponents,
    commonMemberStorage: Fir2IrCommonMemberStorage
) : Fir2IrComponents by components {
    private val classCache: MutableMap<FirRegularClass, IrClass> = commonMemberStorage.classCache

    private val typeAliasCache: MutableMap<FirTypeAlias, IrTypeAlias> = mutableMapOf()

    private val typeParameterCache: MutableMap<FirTypeParameter, IrTypeParameter> = commonMemberStorage.typeParameterCache

    private val typeParameterCacheForSetter: MutableMap<FirTypeParameter, IrTypeParameter> = mutableMapOf()

    private val enumEntryCache: MutableMap<FirEnumEntry, IrEnumEntry> = commonMemberStorage.enumEntryCache

    private val codeFragmentCache: MutableMap<FirCodeFragment, IrClass> = mutableMapOf()

    private val fieldsForContextReceivers: MutableMap<IrClass, List<IrField>> = mutableMapOf()

    private val localStorage: Fir2IrLocalClassStorage = Fir2IrLocalClassStorage(
        // Using existing cache is necessary here to be able to serialize local classes from common code in expression codegen
        commonMemberStorage.localClassCache
    )

    private fun FirTypeRef.toIrType(typeOrigin: ConversionTypeOrigin = ConversionTypeOrigin.DEFAULT): IrType =
        with(typeConverter) { toIrType(typeOrigin) }

    @OptIn(IrSymbolInternals::class)
    fun preCacheBuiltinClasses() {
        for ((classId, irBuiltinSymbol) in typeConverter.classIdToSymbolMap) {
            // toSymbol() can return null when using an old stdlib that's missing some types
            val firClass = classId.toSymbol(session)?.fir as FirRegularClass? ?: continue
            val irClass = irBuiltinSymbol.owner
            classCache[firClass] = irClass
            classifiersGenerator.processClassHeader(firClass, irClass)
            declarationStorage.preCacheBuiltinClassMembers(firClass, irClass)
        }
        for ((primitiveClassId, primitiveArrayId) in StandardClassIds.primitiveArrayTypeByElementType) {
            // toSymbol() can return null when using an old stdlib that's missing some types
            val firClass = primitiveArrayId.toLookupTag().toSymbol(session)?.fir as FirRegularClass? ?: continue
            val irType = typeConverter.classIdToTypeMap[primitiveClassId]
            val irClass = irBuiltIns.primitiveArrayForType[irType]!!.owner
            classCache[firClass] = irClass
            classifiersGenerator.processClassHeader(firClass, irClass)
            declarationStorage.preCacheBuiltinClassMembers(firClass, irClass)
        }
    }

    // Note: declareTypeParameters should be called before!

    internal fun preCacheTypeParameters(owner: FirTypeParameterRefsOwner, irOwnerSymbol: IrSymbol) {
        for ((index, typeParameter) in owner.typeParameters.withIndex()) {
            val original = typeParameter.symbol.fir
            getCachedIrTypeParameter(original)
                ?: createAndCacheIrTypeParameter(original, index, irOwnerSymbol)
            if (owner is FirProperty && owner.isVar) {
                val context = ConversionTypeOrigin.SETTER
                getCachedIrTypeParameter(original, context)
                    ?: createAndCacheIrTypeParameter(original, index, irOwnerSymbol, context)
            }
        }
    }

    private fun createAndCacheIrTypeParameter(
        typeParameter: FirTypeParameter,
        index: Int,
        ownerSymbol: IrSymbol,
        typeOrigin: ConversionTypeOrigin = ConversionTypeOrigin.DEFAULT,
    ): IrTypeParameter {
        val irTypeParameter = classifiersGenerator.createIrTypeParameterWithoutBounds(typeParameter, index, ownerSymbol)
        // Cache the type parameter BEFORE processing its bounds/supertypes, to properly handle recursive type bounds.
        if (typeOrigin.forSetter) {
            typeParameterCacheForSetter[typeParameter] = irTypeParameter
        } else {
            typeParameterCache[typeParameter] = irTypeParameter
        }
        return irTypeParameter
    }

    internal fun setTypeParameters(
        irOwner: IrTypeParametersContainer,
        owner: FirTypeParameterRefsOwner,
        typeOrigin: ConversionTypeOrigin = ConversionTypeOrigin.DEFAULT
    ) {
        classifiersGenerator.setTypeParameters(irOwner, owner, typeOrigin)
    }

    fun getFieldsWithContextReceiversForClass(irClass: IrClass, klass: FirClass): List<IrField> {
        if (klass !is FirRegularClass || klass.contextReceivers.isEmpty()) return emptyList()

        return fieldsForContextReceivers.getOrPut(irClass) {
            klass.contextReceivers.withIndex().map { (index, contextReceiver) ->
                components.irFactory.createField(
                    startOffset = UNDEFINED_OFFSET,
                    endOffset = UNDEFINED_OFFSET,
                    origin = IrDeclarationOrigin.FIELD_FOR_CLASS_CONTEXT_RECEIVER,
                    name = Name.identifier("contextReceiverField$index"),
                    visibility = DescriptorVisibilities.PRIVATE,
                    symbol = IrFieldSymbolImpl(),
                    type = contextReceiver.typeRef.toIrType(),
                    isFinal = true,
                    isStatic = false,
                    isExternal = false,
                ).also {
                    it.parent = irClass
                }
            }
        }
    }

    fun getCachedIrClass(klass: FirClass): IrClass? {
        return if (klass is FirAnonymousObject || klass is FirRegularClass && klass.visibility == Visibilities.Local) {
            localStorage[klass]
        } else {
            classCache[klass]
        }
    }

    private fun getCachedLocalClass(lookupTag: ConeClassLikeLookupTag): IrClass? {
        return localStorage[lookupTag.toSymbol(session)!!.fir as FirClass]
    }

    fun getCachedIrCodeFragment(codeFragment: FirCodeFragment): IrClass? {
        return codeFragmentCache[codeFragment]
    }

    fun createAndCacheIrTypeAlias(
        typeAlias: FirTypeAlias,
        parent: IrDeclarationParent
    ): IrTypeAlias {
        return classifiersGenerator.createIrTypeAlias(typeAlias, parent).also {
            typeAliasCache[typeAlias] = it
        }
    }

    internal fun getCachedTypeAlias(firTypeAlias: FirTypeAlias): IrTypeAlias? = typeAliasCache[firTypeAlias]

    fun createAndCacheIrClass(
        regularClass: FirRegularClass,
        parent: IrDeclarationParent,
        predefinedOrigin: IrDeclarationOrigin? = null
    ): IrClass {
        return classifiersGenerator.createIrClass(regularClass, parent, predefinedOrigin).also {
            if (regularClass.visibility == Visibilities.Local) {
                localStorage[regularClass] = it
            } else {
                classCache[regularClass] = it
            }
        }
    }

    fun createAndCacheAnonymousObject(
        anonymousObject: FirAnonymousObject,
        visibility: Visibility = Visibilities.Local,
        name: Name = SpecialNames.NO_NAME_PROVIDED,
        irParent: IrDeclarationParent? = null
    ): IrClass {
        return classifiersGenerator.createAnonymousObject(anonymousObject, visibility, name, irParent).also {
            localStorage[anonymousObject] = it
        }
    }

    fun createAndCacheCodeFragmentClass(codeFragment: FirCodeFragment, containingFile: IrFile): IrClass {
        return classifiersGenerator.createCodeFragmentClass(codeFragment, containingFile).also {
            codeFragmentCache[codeFragment] = it
        }
    }

    fun getIrAnonymousObjectForEnumEntry(anonymousObject: FirAnonymousObject, name: Name, irParent: IrClass?): IrClass {
        localStorage[anonymousObject]?.let { return it }
        val irAnonymousObject = classifierStorage.createAndCacheAnonymousObject(anonymousObject, Visibilities.Private, name, irParent)
        classifiersGenerator.processClassHeader(anonymousObject, irAnonymousObject)
        return irAnonymousObject
    }

    internal fun getCachedIrTypeParameter(
        typeParameter: FirTypeParameter,
        typeOrigin: ConversionTypeOrigin = ConversionTypeOrigin.DEFAULT
    ): IrTypeParameter? {
        return if (typeOrigin.forSetter)
            typeParameterCacheForSetter[typeParameter]
        else
            typeParameterCache[typeParameter]
    }

    internal fun getIrTypeParameter(
        typeParameter: FirTypeParameter,
        index: Int,
        ownerSymbol: IrSymbol,
        typeOrigin: ConversionTypeOrigin = ConversionTypeOrigin.DEFAULT
    ): IrTypeParameter {
        getCachedIrTypeParameter(typeParameter, typeOrigin)?.let { return it }
        val irTypeParameter = createAndCacheIrTypeParameter(typeParameter, index, ownerSymbol, typeOrigin)
        classifiersGenerator.initializeTypeParameterBounds(typeParameter, irTypeParameter)
        return irTypeParameter
    }

    fun putEnumEntryClassInScope(enumEntry: FirEnumEntry, correspondingClass: IrClass) {
        localStorage[(enumEntry.initializer as FirAnonymousObjectExpression).anonymousObject] = correspondingClass
    }

    internal fun getCachedIrEnumEntry(enumEntry: FirEnumEntry): IrEnumEntry? = enumEntryCache[enumEntry]

    fun getIrEnumEntry(
        enumEntry: FirEnumEntry,
        irParent: IrClass,
        predefinedOrigin: IrDeclarationOrigin? = null,
    ): IrEnumEntry {
        getCachedIrEnumEntry(enumEntry)?.let { return it }

        val firProviderForEntry = enumEntry.moduleData.session.firProvider
        val containingFile = firProviderForEntry.getFirCallableContainerFile(enumEntry.symbol)

        @Suppress("NAME_SHADOWING")
        val predefinedOrigin = predefinedOrigin ?: if (containingFile != null) {
            IrDeclarationOrigin.DEFINED
        } else {
            irParent.origin
        }
        return classifiersGenerator.createIrEnumEntry(
            enumEntry,
            irParent = irParent,
            predefinedOrigin = predefinedOrigin
        ).also {
            enumEntryCache[enumEntry] = it
        }
    }

    @OptIn(IrSymbolInternals::class)
    fun findIrClass(lookupTag: ConeClassLikeLookupTag): IrClass? {
        return if (lookupTag.classId.isLocal) {
            getCachedLocalClass(lookupTag)
        } else {
            val firSymbol = lookupTag.toSymbol(session)
            if (firSymbol is FirClassSymbol) {
                getIrClassSymbol(firSymbol).owner
            } else {
                null
            }
        }
    }

    fun getIrClassSymbol(firClassSymbol: FirClassSymbol<*>): IrClassSymbol {
        return classifiersGenerator.createIrClassSymbolByFirSymbol(firClassSymbol)
    }

    fun getIrTypeParameterSymbol(
        firTypeParameterSymbol: FirTypeParameterSymbol,
        typeOrigin: ConversionTypeOrigin
    ): IrTypeParameterSymbol {
        val firTypeParameter = firTypeParameterSymbol.fir

        val cachedSymbol = getCachedIrTypeParameter(firTypeParameter, typeOrigin)?.symbol
            ?: typeParameterCache[firTypeParameter]?.symbol // We can try to use default cache because setter can use parent type parameters

        if (cachedSymbol != null) {
            return cachedSymbol
        }

        if (components.configuration.allowNonCachedDeclarations) {
            return createIrTypeParameterForNonCachedDeclaration(firTypeParameter)
        }

        error("Cannot find cached type parameter by FIR symbol: ${firTypeParameterSymbol.name} of the owner: ${firTypeParameter.containingDeclarationSymbol}")
    }

    private fun createIrTypeParameterForNonCachedDeclaration(firTypeParameter: FirTypeParameter): IrTypeParameterSymbol {
        val firTypeParameterOwnerSymbol = firTypeParameter.containingDeclarationSymbol
        val firTypeParameterOwner = firTypeParameterOwnerSymbol.fir as FirTypeParameterRefsOwner
        val index = firTypeParameterOwner.typeParameters.indexOf(firTypeParameter).also { check(it >= 0) }

        val isSetter = firTypeParameterOwner is FirPropertyAccessor && firTypeParameterOwner.isSetter
        val conversionTypeOrigin = if (isSetter) ConversionTypeOrigin.SETTER else ConversionTypeOrigin.DEFAULT

        return createAndCacheIrTypeParameter(firTypeParameter, index, IrTypeParameterSymbolImpl(), conversionTypeOrigin).also {
            classifiersGenerator.initializeTypeParameterBounds(firTypeParameter, it)
        }.symbol
    }

}
