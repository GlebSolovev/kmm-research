/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.tools

import org.gradle.api.DefaultTask
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.artifacts.Configuration
import org.gradle.api.attributes.Usage
import org.gradle.api.file.FileCollection
import org.gradle.api.plugins.BasePlugin
import org.gradle.api.tasks.*
import org.gradle.kotlin.dsl.*
import org.gradle.language.base.plugins.LifecycleBasePlugin
import org.jetbrains.kotlin.dependencies.NativeDependenciesBasePlugin
import org.jetbrains.kotlin.dependencies.NativeDependenciesUsage
import org.jetbrains.kotlin.dependencies.nativeDependency
import org.jetbrains.kotlin.konan.target.*
import org.jetbrains.kotlin.konan.target.HostManager.Companion.hostIsMac
import org.jetbrains.kotlin.konan.target.HostManager.Companion.hostIsMingw
import org.jetbrains.kotlin.platformManager
import java.io.File
import kotlin.collections.List
import kotlin.collections.MutableMap
import kotlin.collections.addAll
import kotlin.collections.drop
import kotlin.collections.first
import kotlin.collections.flatMap
import kotlin.collections.forEach
import kotlin.collections.listOf
import kotlin.collections.map
import kotlin.collections.mutableListOf
import kotlin.collections.mutableMapOf
import kotlin.collections.plusAssign
import kotlin.collections.set
import kotlin.collections.toTypedArray

open class NativePlugin : Plugin<Project> {
    override fun apply(project: Project) {
        project.apply<BasePlugin>()
        project.apply<NativeDependenciesBasePlugin>()
        project.extensions.create("native", NativeToolsExtension::class.java, project)
    }
}

abstract class ToolExecutionTask : DefaultTask() {
    @get:OutputFile
    abstract var output: File

    @get:InputFiles
    abstract var input: List<File>

    @get:Input
    abstract var cmd: String

    @get:Input
    abstract var args: List<String>

    @TaskAction
    fun action() {
        if (output.exists()) output.delete()
        project.exec {
            executable(cmd)
            args(*this@ToolExecutionTask.args.toTypedArray())
        }
    }
}

class ToolPatternImpl(val extension: NativeToolsExtension, val output:String, vararg val input: String):ToolPattern {
    val tool = mutableListOf<String>()
    val args = mutableListOf<String>()
    override fun ruleOut(): String = output
    override fun ruleInFirst(): String = input.first()
    override fun ruleInAll(): Array<String> = arrayOf(*input)

    override fun flags(vararg args: String) {
        this.args.addAll(args)
    }

    override fun tool(vararg arg: String) {
        tool.addAll(arg)
    }

    override fun env(name: String) = emptyArray<String>()

    fun configure(task: ToolExecutionTask, configureDepencies:Boolean) {
        extension.cleanupFiles += output
        task.input = input.map {
            extension.project.file(it)
        }
        // TODO: Be more precise. It probably requires only llvm + host toolchain.
        task.dependsOn(":kotlin-native:dependencies:update")
        if (configureDepencies)
            task.input.forEach { task.dependsOn(it.name) }
        val file = extension.project.file(output)
        file.parentFile.mkdirs()
        task.output = file
        task.cmd = tool.first()
        task.args = listOf(*tool.drop(1).toTypedArray(), *args.toTypedArray())
    }
}

open class SourceSet(
    val sourceSets: SourceSets,
    val name: String,
    val initialDirectory: File = sourceSets.project.projectDir,
    val initialSourceSet: SourceSet? = null,
    val rule: Pair<String, String>? = null
) {
    var collection = sourceSets.project.objects.fileCollection() as FileCollection
    fun file(path: String) {
        collection = collection.plus(sourceSets.project.files("${initialDirectory.absolutePath}/$path"))
    }

    fun dir(path: String) {
        sourceSets.project.fileTree("${initialDirectory.absolutePath}/$path").files.forEach {
            collection = collection.plus(sourceSets.project.files(it))
        }
    }

    fun transform(suffixes: Pair<String, String>): SourceSet {
        return SourceSet(
            sourceSets,
            name,
            sourceSets.project.file("${sourceSets.project.buildDir}/$name/${suffixes.first}_${suffixes.second}/"),
            this,
            suffixes
        )
    }

    fun implicitTasks(): Array<TaskProvider<*>> {
        rule ?: return emptyArray()
        initialSourceSet?.implicitTasks()
        return initialSourceSet!!.collection
            .filter { !it.isDirectory() }
            .filter { it.name.endsWith(rule.first) }
            .map { it.relativeTo(initialSourceSet.initialDirectory) }
            .map { it.path }
            .map { it to (it.substring(0, it.lastIndexOf(rule.first)) + rule.second) }
            .map {
                file(it.second)
                sourceSets.project.file("${initialSourceSet.initialDirectory.path}/${it.first}") to sourceSets.project.file("${initialDirectory.path}/${it.second}")
            }.map {
                sourceSets.project.tasks.register<ToolExecutionTask>(it.second.name, ToolExecutionTask::class.java) {
                    val toolConfiguration = ToolPatternImpl(sourceSets.extension, it.second.path, it.first.path)
                    sourceSets.extension.toolPatterns[rule]!!.invoke(toolConfiguration)
                    toolConfiguration.configure(this, initialSourceSet.rule != null)
                }
            }.toTypedArray()
    }
}

class SourceSets(val project: Project, val extension: NativeToolsExtension, val sources: MutableMap<String, SourceSet>) :
    MutableMap<String, SourceSet> by sources {
    operator fun String.invoke(initialDirectory: File = project.projectDir, configuration: SourceSet.() -> Unit) {
        sources[this] = SourceSet(this@SourceSets, this, initialDirectory).also {
            configuration(it)
        }
    }
}


interface Environment {
    operator fun String.invoke(vararg values: String)
}

interface ToolPattern {
    fun ruleOut(): String
    fun ruleInFirst(): String
    fun ruleInAll(): Array<String>
    fun flags(vararg args: String): Unit
    fun tool(vararg arg: String): Unit
    fun env(name: String): Array<String>
}


typealias ToolPatternConfiguration = ToolPattern.() -> Unit
typealias EnvironmentConfiguration = Environment.() -> Unit

class ToolConfigurationPatterns(
    val extension: NativeToolsExtension,
    val patterns: MutableMap<Pair<String, String>, ToolPatternConfiguration>
) : MutableMap<Pair<String, String>, ToolPatternConfiguration> by patterns {
    operator fun Pair<String, String>.invoke(configuration: ToolPatternConfiguration) {
        patterns[this] = configuration
    }
}


open class NativeToolsExtension(val project: Project) {
    private val platformManager = project.extensions.getByType<PlatformManager>()

    val nativePluginNativeDependencies: Configuration by project.configurations.creating {
        description = "Native dependencies"
        isCanBeConsumed = false
        isCanBeResolved = true
        attributes {
            attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
        }
        defaultDependencies {
            add(project.dependencies.project(":kotlin-native:dependencies"))
        }
    }

    val nativePluginLLVMDependency: Configuration by project.configurations.creating {
        description = "Native dependencies (llvm)"
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
        get() = nativePluginLLVMDependency.singleFile.canonicalPath

    val hostPlatform: Platform
        get() = platformManager.hostPlatform

    val sourceSets = SourceSets(project, this, mutableMapOf<String, SourceSet>())
    val toolPatterns = ToolConfigurationPatterns(this, mutableMapOf<Pair<String, String>, ToolPatternConfiguration>())
    val cleanupFiles = mutableListOf<String>()
    fun sourceSet(configuration: SourceSets.() -> Unit) {
        sourceSets.configuration()
    }

    var environmentConfiguration: EnvironmentConfiguration? = null
    fun environment(configuration: EnvironmentConfiguration) {
        environmentConfiguration = configuration
    }

    fun suffixes(configuration: ToolConfigurationPatterns.() -> Unit) = toolPatterns.configuration()

    fun target(name: String, vararg objSet: SourceSet, configuration: ToolPatternConfiguration) {
        project.tasks.named(LifecycleBasePlugin.CLEAN_TASK_NAME, Delete::class.java).configure {
            doLast {
                delete(*this@NativeToolsExtension.cleanupFiles.toTypedArray())
            }
        }

        sourceSets.project.tasks.create(name, ToolExecutionTask::class.java) {
            objSet.forEach {
                dependsOn(it.implicitTasks())
            }
            dependsOn(nativePluginNativeDependencies)
            dependsOn(nativePluginLLVMDependency)
            val deps = objSet.flatMap { it.collection.files }.map { it.path }
            val toolConfiguration = ToolPatternImpl(sourceSets.extension, "${project.buildDir.path}/$name", *deps.toTypedArray())
            toolConfiguration.configuration()
            toolConfiguration.configure(this, false )
        }
    }
}


fun solib(name: String) = when {
    hostIsMingw -> "$name.dll"
    hostIsMac -> "lib$name.dylib"
    else -> "lib$name.so"
}

fun lib(name:String) = when {
    hostIsMingw -> "$name.lib"
    else -> "lib$name.a"
}