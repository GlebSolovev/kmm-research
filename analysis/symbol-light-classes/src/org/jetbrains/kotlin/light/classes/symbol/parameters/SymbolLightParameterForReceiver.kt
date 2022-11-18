/*
 * Copyright 2010-2022 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.light.classes.symbol.parameters

import com.intellij.psi.PsiAnnotation
import com.intellij.psi.PsiIdentifier
import com.intellij.psi.PsiModifierList
import com.intellij.psi.PsiType
import org.jetbrains.kotlin.analysis.api.KtAnalysisSession
import org.jetbrains.kotlin.analysis.api.annotations.annotations
import org.jetbrains.kotlin.analysis.api.symbols.KtCallableSymbol
import org.jetbrains.kotlin.analysis.api.symbols.KtReceiverParameterSymbol
import org.jetbrains.kotlin.analysis.api.symbols.markers.KtNamedSymbol
import org.jetbrains.kotlin.analysis.api.symbols.pointers.KtSymbolPointer
import org.jetbrains.kotlin.asJava.classes.lazyPub
import org.jetbrains.kotlin.codegen.AsmUtil
import org.jetbrains.kotlin.light.classes.symbol.*
import org.jetbrains.kotlin.light.classes.symbol.annotations.SymbolLightAnnotationForAnnotationCall
import org.jetbrains.kotlin.light.classes.symbol.annotations.computeNullabilityAnnotation
import org.jetbrains.kotlin.light.classes.symbol.classes.analyzeForLightClasses
import org.jetbrains.kotlin.light.classes.symbol.methods.SymbolLightMethodBase
import org.jetbrains.kotlin.light.classes.symbol.modifierLists.SymbolLightClassModifierList
import org.jetbrains.kotlin.psi.KtParameter

internal class SymbolLightParameterForReceiver private constructor(
    private val receiverPointer: KtSymbolPointer<KtReceiverParameterSymbol>,
    methodName: String,
    method: SymbolLightMethodBase,
) : SymbolLightParameterBase(method) {
    private inline fun <T> withReceiverSymbol(crossinline action: context(KtAnalysisSession) (KtReceiverParameterSymbol) -> T): T {
        return analyzeForLightClasses(ktModule) {
            action(this, receiverPointer.restoreSymbolOrThrowIfDisposed())
        }
    }

    companion object {
        fun tryGet(
            callableSymbolPointer: KtSymbolPointer<KtCallableSymbol>,
            method: SymbolLightMethodBase
        ): SymbolLightParameterForReceiver? = analyzeForLightClasses(method.ktModule) {
            val callableSymbol = callableSymbolPointer.restoreSymbolOrThrowIfDisposed()
            if (callableSymbol !is KtNamedSymbol) return@analyzeForLightClasses null
            if (!callableSymbol.isExtension) return@analyzeForLightClasses null
            val receiverSymbol = callableSymbol.receiverParameter ?: return@analyzeForLightClasses null

            SymbolLightParameterForReceiver(
                receiverPointer = receiverSymbol.createPointer(),
                methodName = callableSymbol.name.asString(),
                method = method,
            )
        }
    }

    private val _name: String by lazyPub {
        AsmUtil.getLabeledThisName(methodName, AsmUtil.LABELED_THIS_PARAMETER, AsmUtil.RECEIVER_PARAMETER_NAME)
    }

    override fun getNameIdentifier(): PsiIdentifier? = null

    override fun getName(): String = _name

    override fun isVarArgs() = false
    override fun hasModifierProperty(name: String): Boolean = false

    override val kotlinOrigin: KtParameter? = null

    private val _annotations: List<PsiAnnotation> by lazyPub {
        withReceiverSymbol { receiver ->
            buildList {
                receiver.type.nullabilityType.computeNullabilityAnnotation(this@SymbolLightParameterForReceiver)?.let(::add)
                receiver.annotations.mapTo(this) {
                    SymbolLightAnnotationForAnnotationCall(it, this@SymbolLightParameterForReceiver)
                }
            }
        }
    }

    override fun getModifierList(): PsiModifierList = _modifierList

    private val _modifierList: PsiModifierList by lazy {
        SymbolLightClassModifierList(this, lazyOf(emptySet()), lazyOf(_annotations))
    }

    private val _type: PsiType by lazy {
        withReceiverSymbol { receiver ->
            receiver.type.asPsiType(this@SymbolLightParameterForReceiver)
        } ?: nonExistentType()
    }

    override fun getType(): PsiType = _type

    override fun equals(other: Any?): Boolean = this === other ||
            other is SymbolLightParameterForReceiver &&
            ktModule == other.ktModule &&
            compareSymbolPointers(ktModule, receiverPointer, other.receiverPointer)

    override fun hashCode(): Int = _name.hashCode()

    override fun isValid(): Boolean = super.isValid() && receiverPointer.isValid(ktModule)
}
