/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.artifacts.ProjectDependency
import org.gradle.api.artifacts.dsl.DependencyHandler

fun DependencyHandler.nativeDependency(dependency: ProjectDependency, dependencyName: String) = dependency.copy().apply {
    capabilities {
        requireCapability(NativeDependenciesBasePlugin.dependencyCapability(dependencyProject, dependencyName))
    }
}