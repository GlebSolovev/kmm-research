/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.dependencies

import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.artifacts.Configuration
import org.gradle.api.attributes.Usage
import org.gradle.api.file.DirectoryProperty
import org.gradle.api.logging.LogLevel
import org.gradle.api.provider.Property
import org.gradle.kotlin.dsl.*
import org.jetbrains.kotlin.konan.properties.KonanPropertiesLoader
import org.jetbrains.kotlin.konan.target.PlatformManager
import org.jetbrains.kotlin.konan.target.TargetDomainObjectContainer
import org.jetbrains.kotlin.konan.target.TargetWithSanitizer
import org.jetbrains.kotlin.konan.util.DependencyProcessor
import org.jetbrains.kotlin.utils.capitalized
import javax.inject.Inject

abstract class NativeDependenciesExtension @Inject constructor(private val project: Project) : TargetDomainObjectContainer<NativeDependenciesExtension.Target>(project) {
    init {
        this.factory = { target ->
            project.objects.newInstance<Target>(this, target)
        }
    }

    val nativeDependenciesElements: Configuration by project.configurations.creating {
        description = "Native dependencies"
        isCanBeConsumed = true
        isCanBeResolved = false
        attributes {
            attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
        }
    }

    val llvmElements: Configuration by project.configurations.creating {
        description = "Native dependencies (llvm)"
        isCanBeConsumed = true
        isCanBeResolved = false
        attributes {
            attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
        }
        outgoing {
            capability(NativeDependenciesConsumerPlugin.llvmCapability(project))
        }
    }

    val libffiElements: Configuration by project.configurations.creating {
        description = "Native dependencies (libffi)"
        isCanBeConsumed = true
        isCanBeResolved = false
        attributes {
            attribute(Usage.USAGE_ATTRIBUTE, project.objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
        }
        outgoing {
            capability(NativeDependenciesConsumerPlugin.libffiCapability(project))
        }
    }

    /**
     * Base directory where to download dependencies
     */
    abstract val dependenciesDir: DirectoryProperty

    /**
     * URL with dependencies repository
     */
    abstract val baseUrl: Property<String>

    abstract class Target @Inject constructor(
            private val owner: NativeDependenciesExtension,
            private val _target: TargetWithSanitizer,
    ) {
        val target by _target::target
        val sanitizer by _target::sanitizer

        private val project by owner::project

        private val platformManager = project.extensions.getByType<PlatformManager>()

        private val loader: KonanPropertiesLoader = platformManager.loader(target).let {
            require(it is KonanPropertiesLoader) {
                "loader for $target must implement ${KonanPropertiesLoader::class}"
            }
            it
        }

        private val dependencyProcessor by lazy {
            DependencyProcessor(
                    owner.dependenciesDir.apply { finalizeValue() }.asFile.get(),
                    loader,
                    owner.baseUrl.apply { finalizeValue() }.get(),
                    keepUnstable = false) { url, currentBytes, totalBytes ->
                // TODO: Consider using logger.
                print("\nDownloading dependency for $_target: $url (${currentBytes}/${totalBytes}). ")
            }.apply {
                showInfo = project.logger.isEnabled(LogLevel.INFO)
            }
        }

        val dependencies by loader::dependencies

        val task = project.tasks.register<NativeDependencies>("nativeDependencies${_target.name.capitalized}") {
            description = "Download dependencies for $_target"
            group = "native dependencies"
            dependencyProcessor.set(this@Target.dependencyProcessor)
            dependencies.set(this@Target.dependencies)
        }

        init {
            owner.nativeDependenciesElements.outgoing {
                variants {
                    create("$_target") {
                        attributes {
                            attribute(TargetWithSanitizer.TARGET_ATTRIBUTE, _target)
                        }
                        artifact(task)
                    }
                }
            }
            loader.llvmHome?.let { llvm ->
                owner.llvmElements.outgoing {
                    variants {
                        create("$_target") {
                            attributes {
                                attribute(TargetWithSanitizer.TARGET_ATTRIBUTE, _target)
                            }
                            artifact(dependencyProcessor.resolve(llvm)) {
                                builtBy(task)
                            }
                        }
                    }
                }
            }
            loader.libffiDir?.let { libffi ->
                owner.libffiElements.outgoing {
                    variants {
                        create("$_target") {
                            attributes {
                                attribute(TargetWithSanitizer.TARGET_ATTRIBUTE, _target)
                            }
                            artifact(dependencyProcessor.resolve(libffi)) {
                                builtBy(task)
                            }
                        }
                    }
                }
            }
        }
    }
}

open class NativeDependenciesPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        project.apply<NativeDependenciesConsumerPlugin>()
        project.extensions.create<NativeDependenciesExtension>("nativeDependencies", project)
    }
}