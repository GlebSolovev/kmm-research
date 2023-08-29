/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.artifacts.Configuration
import org.gradle.api.attributes.Usage
import org.gradle.kotlin.dsl.*
import org.jetbrains.kotlin.konan.target.HostManager
import org.jetbrains.kotlin.konan.target.Platform
import org.jetbrains.kotlin.konan.target.PlatformManager
import javax.inject.Inject

abstract class HostPlatformDependenciesExtension @Inject constructor(private val project: Project) {
    private val platformManager = project.extensions.getByType<PlatformManager>()

    val hostPlatformNativeDependencies: Configuration by project.configurations.creating {
        description = "Native dependencies for host"
        isCanBeConsumed = false
        isCanBeResolved = true
        attributes {
            attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
        }
        defaultDependencies {
            add(project.dependencies.project(":kotlin-native:dependencies"))
        }
    }

    val hostPlatformLLVMDependency: Configuration by project.configurations.creating {
        description = "LLVM dependency for host"
        isCanBeConsumed = false
        isCanBeResolved = true
        attributes {
            attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
        }
        defaultDependencies {
            add(project.dependencies.nativeDependency(project.dependencies.project(":kotlin-native:dependencies"), platformManager.loader(HostManager.host).llvmHome!!))
        }
    }

    val llvmDirectoryPath: String
        get() = hostPlatformLLVMDependency.singleFile.canonicalPath

    val hostPlatform: Platform
        get() = platformManager.hostPlatform
}

class HostPlatformDependenciesPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        project.apply<NativeDependenciesBasePlugin>()
        project.extensions.create<HostPlatformDependenciesExtension>("hostPlatformDependencies", project)
    }
}