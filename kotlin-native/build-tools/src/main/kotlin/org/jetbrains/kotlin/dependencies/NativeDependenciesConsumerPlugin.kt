/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.artifacts.Configuration
import org.gradle.api.attributes.Usage
import org.gradle.api.file.Directory
import org.gradle.api.file.ProjectLayout
import org.gradle.api.provider.Provider
import org.gradle.kotlin.dsl.*
import org.jetbrains.kotlin.konan.target.HostManager
import org.jetbrains.kotlin.konan.target.PlatformManager
import javax.inject.Inject

private fun Configuration.singleDirectory(layout: ProjectLayout): Provider<Directory> {
    return layout.dir(elements.map { it.single().asFile })
}

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

    val llvmDirectory: Provider<Directory>
        get() = llvmConfiguration?.singleDirectory(project.layout) ?: error("Call llvm() during nativeDependencies configuration")

    val llvmDirectoryPath: String
        get() = llvmConfiguration?.singleFile?.canonicalPath ?: error("Call llvm() during nativeDependencies configuration")
}

class NativeDependenciesConsumerPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        project.apply<NativeDependenciesBasePlugin>()
        project.extensions.create<NativeDependenciesConsumerExtension>("nativeDependencies", project)
    }
}