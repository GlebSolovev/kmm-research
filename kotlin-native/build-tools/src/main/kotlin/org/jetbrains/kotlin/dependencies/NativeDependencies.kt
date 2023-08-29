/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.DefaultTask
import org.gradle.api.provider.ListProperty
import org.gradle.api.provider.Property
import org.gradle.api.provider.Provider
import org.gradle.api.tasks.Input
import org.gradle.api.tasks.Internal
import org.gradle.api.tasks.OutputDirectories
import org.gradle.api.tasks.TaskAction
import org.gradle.api.tasks.UntrackedTask
import org.jetbrains.kotlin.konan.util.DependencyProcessor
import java.io.File

/**
 * Downloader of native dependencies.
 *
 * Serves as a Gradle task wrapper around [DependencyProcessor].
 */
@UntrackedTask(because = "Output is large and work avoidance is performed in DependencyProcessor anyway")
abstract class NativeDependencies : DefaultTask() {
    /**
     * [DependencyProcessor] that will actually perform downloading
     */
    @get:Internal
    abstract val dependencyProcessor: Property<DependencyProcessor>

    /**
     * List of dependencies that will be downloaded.
     *
     * Must be in sync with [dependencyProcessor]
     */
    @get:Input
    abstract val dependencies: ListProperty<String>

    /**
     * Directories where all downloaded dependencies are stored.
     */
    @get:OutputDirectories
    val dependenciesDirectories: Provider<List<File>>
        get() = dependencies.map {
            dependencyProcessor.get().run {
                it.map(this::resolve)
            }
        }

    @TaskAction
    fun downloadAndExtract() {
        dependencyProcessor.get().run()
    }
}