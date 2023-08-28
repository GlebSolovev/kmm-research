/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.Project
import org.gradle.api.artifacts.ProjectDependency
import org.gradle.api.artifacts.dsl.DependencyHandler
import org.jetbrains.kotlin.cpp.module

fun DependencyHandler.llvm(dependency: ProjectDependency): ProjectDependency = dependency.copy().apply {
    capabilities {
        requireCapability(NativeDependenciesConsumerPlugin.llvmCapability(dependencyProject))
    }
}

fun DependencyHandler.libffi(dependency: ProjectDependency): ProjectDependency = dependency.copy().apply {
    capabilities {
        requireCapability(NativeDependenciesConsumerPlugin.libffiCapability(dependencyProject))
    }
}

// TODO: Remove when .gradle is gone from K/N build.
fun DependencyHandler.llvm(project: Project): ProjectDependency = llvm(
        dependency = this.project(mapOf("path" to project.path)) as ProjectDependency
)