/*
 * Copyright 2010-2022 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.cpp

import org.gradle.api.DefaultTask
import org.gradle.api.file.*
import org.gradle.api.model.ObjectFactory
import org.gradle.api.provider.ListProperty
import org.gradle.api.provider.Property
import org.gradle.api.provider.Provider
import org.gradle.api.provider.ProviderFactory
import org.gradle.api.tasks.*
import org.gradle.kotlin.dsl.getByType
import org.gradle.workers.WorkAction
import org.gradle.workers.WorkParameters
import org.gradle.workers.WorkerExecutor
import org.jetbrains.kotlin.ExecClang
import org.jetbrains.kotlin.bitcode.CompileToBitcodePlugin
import org.jetbrains.kotlin.konan.target.PlatformManager
import java.io.File
import javax.inject.Inject

private abstract class ClangFrontendJob : WorkAction<ClangFrontendJob.Parameters> {
    interface Parameters : WorkParameters {
        val workingDirectory: DirectoryProperty
        val targetName: Property<String>
        val inputFile: RegularFileProperty
        val outputFile: RegularFileProperty
        val compilerExecutable: Property<String>
        val arguments: ListProperty<String>
        val platformManager: Property<PlatformManager>
    }

    @get:Inject
    abstract val objects: ObjectFactory

    override fun execute() {
        with(parameters) {
            val execClang = ExecClang.create(objects, platformManager.get())

            val baseDir = workingDirectory.asFile.get()
            outputFile.get().asFile.parentFile.mkdirs()
            val inputRelativePath = baseDir.toPath().relativize(inputFile.get().asFile.toPath())
            execClang.execKonanClang(targetName.get()) {
                workingDir = baseDir
                executable = compilerExecutable.get()
                args = arguments.get() + listOf(inputRelativePath.toString(), "-o", outputFile.get().asFile.absolutePath)
            }
        }
    }
}

/**
 * Compiling [inputFiles] with clang into LLVM bitcode in [outputFiles].
 *
 * @see CompileToBitcodePlugin
 */
@CacheableTask
abstract class ClangFrontend @Inject constructor(
        private val workerExecutor: WorkerExecutor,
        private val objects: ObjectFactory,
        private val layout: ProjectLayout,
        private val providers: ProviderFactory,
) : DefaultTask() {
    private data class WorkUnit(
            val inputFile: File,
            val outputFile: File,
    )

    private val workUnits: Provider<List<WorkUnit>> = providers.provider {
        val result = mutableListOf<WorkUnit>()
        inputFiles.visit {
            if (!isDirectory) {
                val inputFile = this.file
                val outputFile = outputDirectory.file(relativePath.parent.append(true, "${file.nameWithoutExtension}.bc").pathString).get().asFile
                result.add(WorkUnit(inputFile, outputFile))
            }
        }
        result
    }

    /**
     * Where to put bitcode files generated by clang.
     */
    // Marked as output via [outputFiles]
    @get:Internal
    abstract val outputDirectory: DirectoryProperty

    /**
     * Source files to compile from.
     */
    @get:SkipWhenEmpty
    @get:InputFiles
    @get:PathSensitive(PathSensitivity.RELATIVE)
    abstract val inputFiles: ConfigurableFileTree

    /**
     * Bitcode files generated by clang.
     */
    @get:OutputFiles
    val outputFiles: FileCollection = layout.files(workUnits.map { it.map { workUnit -> workUnit.outputFile } })

    /**
     * Will select the appropriate compiler and additional flags.
     */
    // TODO: Consider specifying full clang execution here and configure it from the plugin.
    @get:Input
    abstract val targetName: Property<String>

    /**
     * The compiler to be used.
     *
     * Currently only `clang` and `clang++` are supported.
     */
    @get:Input
    val compiler: Property<String> = objects.property(String::class.java)

    /**
     * Extra arguments for [compiler].
     */
    @get:Input
    abstract val arguments: ListProperty<String>

    /**
     * Locations to search for headers.
     *
     * Will be passed to the compiler as `-I…` and will also be used to compute task dependencies: recompile if the headers change.
     */
    // Marked as input via [headers].
    @get:Internal
    abstract val headersDirs: ConfigurableFileCollection

    /**
     * Final computed compiler arguments.
     */
    // Marked as input via [headers] and [arguments].
    @get:Internal
    val compilerFlags: Provider<List<String>> = providers.provider {
        listOfNotNull(
                "-c",
                "-emit-llvm"
        ) + headersDirs.map { "-I${it.absolutePath}" } + arguments.get()
    }

    /**
     * Working directory for [compiler].
     *
     * All inputs will be passed to the compiler as relative paths to this directory.
     */
    @get:Internal
    val workingDirectory: DirectoryProperty = objects.directoryProperty()

    @get:Input
    protected val workingDirectoryPath: Provider<String> = workingDirectory.map {
        it.asFile.toRelativeString(layout.projectDirectory.asFile)
    }

    /**
     * Computed header files used for task dependencies tracking.
     */
    @get:InputFiles
    @get:PathSensitive(PathSensitivity.RELATIVE)
    protected val headers: Provider<Collection<File>> = providers.provider {
        // Not using clang's -M* flags because there's a problem with our current include system:
        // We allow includes relative to the current directory and also pass -I for each imported module
        // Given file tree:
        // a:
        //  header.hpp
        // b:
        //  impl.cpp
        // Assume module b adds a to its include path.
        // If b/impl.cpp has #include "header.hpp", it'll be included from a/header.hpp. If we add another file
        // header.hpp into b/, the next compilation of b/impl.cpp will include b/header.hpp. -M flags, however,
        // won't generate a dependency on b/header.hpp, so incremental compilation will be broken.
        // TODO: Apart from dependency generation this also makes it awkward to have two files with
        //       the same name (e.g. Utils.h) in directories a/ and b/: For the b/impl.cpp to include a/header.hpp
        //       it needs to have #include "../a/header.hpp"

        val dirs = mutableSetOf<File>()
        // First add dirs with sources, as clang by default adds directory with the source to the include path.
        workUnits.get().forEach {
            dirs.add(it.inputFile)
        }
        // Now add manually given header dirs.
        dirs.addAll(headersDirs.files)
        layout.files(dirs).asFileTree.matching {
            include("**/*.h", "**/*.hpp")
        }.files
    }

    private val platformManager = project.extensions.getByType<PlatformManager>()
    private val execClang by lazy { ExecClang.create(objects, platformManager) }

    @get:InputFile
    @get:PathSensitive(PathSensitivity.NONE)
    val executable: Provider<RegularFile> = layout.file(compiler.map {
        File(execClang.resolveExecutable(it))
    })

    @TaskAction
    fun compile() {
        val workQueue = workerExecutor.noIsolation()

        workUnits.get().forEach { workUnit ->
            workQueue.submit(ClangFrontendJob::class.java) {
                workingDirectory.set(this@ClangFrontend.workingDirectory)
                targetName.set(this@ClangFrontend.targetName)
                inputFile.set(workUnit.inputFile)
                outputFile.set(workUnit.outputFile)
                compilerExecutable.set(this@ClangFrontend.compiler)
                arguments.set(this@ClangFrontend.compilerFlags)
                platformManager.set(this@ClangFrontend.platformManager)
            }
        }
    }
}
