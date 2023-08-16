/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.konan.blackboxtest.support.irtext

import org.jetbrains.kotlin.KtSourceFile
import org.jetbrains.kotlin.backend.common.extensions.IrPluginContext
import org.jetbrains.kotlin.backend.common.serialization.metadata.DynamicTypeDeserializer
import org.jetbrains.kotlin.backend.common.serialization.signature.IdSignatureDescriptor
import org.jetbrains.kotlin.builtins.DefaultBuiltIns
import org.jetbrains.kotlin.builtins.KotlinBuiltIns
import org.jetbrains.kotlin.builtins.konan.KonanBuiltIns
import org.jetbrains.kotlin.config.CommonConfigurationKeys
import org.jetbrains.kotlin.config.CompilerConfiguration
import org.jetbrains.kotlin.config.LanguageVersionSettings
import org.jetbrains.kotlin.config.languageVersionSettings
import org.jetbrains.kotlin.constant.EvaluatedConstTracker
import org.jetbrains.kotlin.descriptors.ModuleDescriptor
import org.jetbrains.kotlin.descriptors.impl.ModuleDescriptorImpl
import org.jetbrains.kotlin.diagnostics.DiagnosticReporter
import org.jetbrains.kotlin.diagnostics.DiagnosticReporterFactory
import org.jetbrains.kotlin.fir.backend.*
import org.jetbrains.kotlin.fir.declarations.FirFile
import org.jetbrains.kotlin.fir.descriptors.FirModuleDescriptor
import org.jetbrains.kotlin.fir.pipeline.ModuleCompilerAnalyzedOutput
import org.jetbrains.kotlin.incremental.components.LookupTracker
import org.jetbrains.kotlin.ir.declarations.IrModuleFragment
import org.jetbrains.kotlin.ir.util.KotlinMangler
import org.jetbrains.kotlin.konan.blackboxtest.support.CastCompatibleKotlinNativeClassLoader
import org.jetbrains.kotlin.library.metadata.KlibMetadataFactories
import org.jetbrains.kotlin.library.metadata.resolver.KotlinResolvedLibrary
import org.jetbrains.kotlin.library.unresolvedDependencies
import org.jetbrains.kotlin.storage.LockBasedStorageManager
import org.jetbrains.kotlin.test.backend.ir.IrBackendInput
import org.jetbrains.kotlin.test.directives.CodegenTestDirectives
import org.jetbrains.kotlin.test.frontend.fir.FirOutputArtifact
import org.jetbrains.kotlin.test.frontend.fir.getAllNativeDependenciesPaths
import org.jetbrains.kotlin.test.frontend.fir.resolveLibraries
import org.jetbrains.kotlin.test.model.BackendKinds
import org.jetbrains.kotlin.test.model.Frontend2BackendConverter
import org.jetbrains.kotlin.test.model.FrontendKinds
import org.jetbrains.kotlin.test.model.TestModule
import org.jetbrains.kotlin.test.services.TestServices
import org.jetbrains.kotlin.test.services.compilerConfigurationProvider
import org.jetbrains.kotlin.test.services.libraryProvider

class Fir2IrNativeResultsConverter(
    testServices: TestServices
) : Frontend2BackendConverter<FirOutputArtifact, IrBackendInput>(
    testServices,
    FrontendKinds.FIR,
    BackendKinds.IrBackend
) {

    override fun transform(module: TestModule, inputArtifact: FirOutputArtifact): IrBackendInput? =
        try {
            transformInternal(module, inputArtifact)
        } catch (e: Throwable) {
            if (CodegenTestDirectives.IGNORE_FIR2IR_EXCEPTIONS_IF_FIR_CONTAINS_ERRORS in module.directives && inputArtifact.hasErrors) {
                null
            } else {
                throw e
            }
        }

    private fun transformInternal(
        module: TestModule,
        inputArtifact: FirOutputArtifact
    ): IrBackendInput {
        val configuration = testServices.compilerConfigurationProvider.getCompilerConfiguration(module)

        lateinit var mainIrPart: IrModuleFragment
        val dependentIrParts = mutableListOf<IrModuleFragment>()
        val sourceFiles = mutableListOf<KtSourceFile>()
        val firFilesAndComponentsBySourceFile = mutableMapOf<KtSourceFile, Pair<FirFile, Fir2IrComponents>>()

        lateinit var mainPluginContext: IrPluginContext
        var irBuiltIns: IrBuiltInsOverFir? = null

        // KT-61248: TODO Replace reflection for direct import of mangler object, when it would extracted out of `backend.native` module
        val classLoader = CastCompatibleKotlinNativeClassLoader.kotlinNativeClassLoader.classLoader
        val konanManglerIrClass = Class.forName("org.jetbrains.kotlin.backend.konan.serialization.KonanManglerIr", true, classLoader)
        val konanManglerDescClass = Class.forName("org.jetbrains.kotlin.backend.konan.serialization.KonanManglerDesc", true, classLoader)
        val konanManglerFirClass = Class.forName("org.jetbrains.kotlin.backend.konan.FirNativeKotlinMangler", true, classLoader)

        val irMangler = konanManglerIrClass.kotlin.objectInstance as KotlinMangler.IrMangler
        val descMangler = konanManglerDescClass.kotlin.objectInstance as KotlinMangler.DescriptorMangler
        val firMangler = konanManglerFirClass.kotlin.objectInstance as FirMangler

        val commonMemberStorage = Fir2IrCommonMemberStorage(IdSignatureDescriptor(descMangler), firMangler)

        val diagnosticReporter = DiagnosticReporterFactory.createReporter()

        for ((index, part) in inputArtifact.partsForDependsOnModules.withIndex()) {
            val (irModuleFragment, components, pluginContext) =
                part.firAnalyzerFacade.result.outputs.single().convertToNativeIr(
                    testServices,
                    module,
                    configuration,
                    diagnosticReporter,
                    commonMemberStorage,
                    irBuiltIns,
                    irMangler
                )
            irBuiltIns = components.irBuiltIns
            mainPluginContext = pluginContext

            if (index < inputArtifact.partsForDependsOnModules.size - 1) {
                dependentIrParts.add(irModuleFragment)
            } else {
                mainIrPart = irModuleFragment
            }

            sourceFiles.addAll(part.firFiles.mapNotNull { it.value.sourceFile })

            for (firFile in part.firFiles.values) {
                firFilesAndComponentsBySourceFile[firFile.sourceFile!!] = firFile to components
            }
        }

        val result = IrBackendInput.NativeBackendInput(
            mainIrPart,
            dependentIrParts,
            mainPluginContext,
            diagnosticReporter = diagnosticReporter,
            descriptorMangler = commonMemberStorage.symbolTable.signaturer.mangler,
            irMangler = irMangler,
            firMangler = commonMemberStorage.firSignatureComposer.mangler,
        )

        return result
    }
}

fun ModuleCompilerAnalyzedOutput.convertToNativeIr(
    testServices: TestServices,
    module: TestModule,
    configuration: CompilerConfiguration,
    diagnosticReporter: DiagnosticReporter,
    commonMemberStorage: Fir2IrCommonMemberStorage,
    irBuiltIns: IrBuiltInsOverFir?,
    irMangler: KotlinMangler.IrMangler,
): Fir2IrResult {
    // TODO: consider avoiding repeated libraries resolution
    val libraries = resolveLibraries(configuration, getAllNativeDependenciesPaths(module, testServices))
    val (dependencies, builtIns) = loadResolvedLibraries(libraries, configuration.languageVersionSettings, testServices)

    val fir2IrConfiguration = Fir2IrConfiguration(
        languageVersionSettings = configuration.languageVersionSettings,
        diagnosticReporter = diagnosticReporter,
        linkViaSignatures = true,
        evaluatedConstTracker = configuration
            .putIfAbsent(CommonConfigurationKeys.EVALUATED_CONST_TRACKER, EvaluatedConstTracker.create()),
        inlineConstTracker = null,
        allowNonCachedDeclarations = false,
    )
    return convertToIr(
        Fir2IrExtensions.Default,
        fir2IrConfiguration,
        commonMemberStorage,
        irBuiltIns,
        irMangler,
        Fir2IrVisibilityConverter.Default,
        builtIns ?: DefaultBuiltIns.Instance // TODO: consider passing externally,
    ).also {
        (it.irModuleFragment.descriptor as? FirModuleDescriptor)?.let { it.allDependencyModules = dependencies }
    }
}

internal val KlibFactories = KlibMetadataFactories(::KonanBuiltIns, DynamicTypeDeserializer)

private fun loadResolvedLibraries(
    resolvedLibraries: List<KotlinResolvedLibrary>,
    languageVersionSettings: LanguageVersionSettings,
    testServices: TestServices
): Pair<List<ModuleDescriptor>, KotlinBuiltIns?> {
    var builtInsModule: KotlinBuiltIns? = null
    val dependencies = mutableListOf<ModuleDescriptorImpl>()

    return resolvedLibraries.map { resolvedLibrary ->
        // resolvedLibrary.library.libraryName in fact resolves to (modified) file path, which is confusing and maybe should be refactored
        testServices.libraryProvider.getOrCreateStdlibByPath(resolvedLibrary.library.libraryName) {
            // TODO: check safety of the approach of creating a separate storage manager per library
            val storageManager = LockBasedStorageManager("ModulesStructure")

            val moduleDescriptor = KlibFactories.DefaultDeserializedDescriptorFactory.createDescriptorOptionalBuiltIns(
                resolvedLibrary.library,
                languageVersionSettings,
                storageManager,
                builtInsModule,
                packageAccessHandler = null,
                lookupTracker = LookupTracker.DO_NOTHING
            )
            dependencies += moduleDescriptor
            moduleDescriptor.setDependencies(ArrayList(dependencies))

            Pair(moduleDescriptor, resolvedLibrary.library)
        }.also {
            val isBuiltIns = resolvedLibrary.library.unresolvedDependencies.isEmpty()
            if (isBuiltIns) builtInsModule = it.builtIns
        }
    } to builtInsModule
}

