/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.Plugin
import org.gradle.api.Project
import org.jetbrains.kotlin.konan.target.registerTargetWithSanitizerAttribute

/**
 * Plugin for projects that use native dependencies.
 *
 * For defining native dependencies see [NativeDependenciesPlugin]
 *
 * @see NativeDependenciesPlugin
 */
// TODO: Consider doing NativeDependenciesBasePlugin like standard gradle plugins that also
//       creates default configurations and lifecycle tasks.
class NativeDependenciesConsumerPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        project.dependencies.attributesSchema {
            registerTargetWithSanitizerAttribute()
        }
    }

    companion object {
        internal fun llvmCapability(project: Project) = "${project.group}:${project.name}-llvm:${project.version}"
        internal fun libffiCapability(project: Project) = "${project.group}:${project.name}-libffi:${project.version}"
    }
}