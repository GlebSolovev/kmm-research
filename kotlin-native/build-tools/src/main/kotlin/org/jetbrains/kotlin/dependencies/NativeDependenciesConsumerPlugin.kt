/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.Buildable
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.artifacts.Configuration
import org.gradle.api.attributes.Usage
import org.gradle.kotlin.dsl.*
import org.jetbrains.kotlin.konan.target.HostManager
import org.jetbrains.kotlin.konan.target.PlatformManager
import java.io.File
import javax.inject.Inject

abstract class NativeDependenciesConsumerExtension @Inject constructor(private val project: Project) {
    private val platformManager = project.extensions.getByType<PlatformManager>()
    private val loader = platformManager.loader(HostManager.host)

    private var llvmConfiguration: Configuration? = null

    fun llvm() {
        if (llvmConfiguration != null)
            return
        llvmConfiguration = project.configurations.create("llvmNativeDependency") {
            isCanBeConsumed = false
            isCanBeResolved = true
            attributes {
                attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
            }
        }
        val llvmDir = loader.llvmHome ?: error("llvmHome is not defined for ${HostManager.host}")
        project.dependencies {
            llvmConfiguration!!(nativeDependency(project(":kotlin-native:dependencies"), llvmDir))
        }
    }

    val llvmDependency: Buildable
        get() = llvmConfiguration ?: error("Call llvm() during nativeDependencies configuration")

    // TODO: Return provider instead.
    val llvmDirectory: File
        get() = llvmConfiguration?.singleFile ?: error("Call llvm() during nativeDependencies configuration")

    private var libffiConfiguration: Configuration? = null

    fun libffi() {
        if (libffiConfiguration != null)
            return
        libffiConfiguration = project.configurations.create("libffiNativeDependency") {
            isCanBeConsumed = false
            isCanBeResolved = true
            attributes {
                attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
            }
        }
        val libffiDir = loader.libffiDir ?: error("libffiDir is not defined for ${HostManager.host}")
        project.dependencies {
            libffiConfiguration!!(nativeDependency(project(":kotlin-native:dependencies"), libffiDir))
        }
    }

    // TODO: Return provider instead.
    val libffiDirectory: File
        get() = libffiConfiguration?.singleFile ?: error("Call libffi() during nativeDependencies configuration")
}

class NativeDependenciesConsumerPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        project.apply<NativeDependenciesBasePlugin>()
        project.extensions.create<NativeDependenciesConsumerExtension>("nativeDependencies", project)
    }
}