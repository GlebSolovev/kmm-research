/*
 * Copyright 2010-2023 JetBrains s.r.o. Use of this source code is governed by the Apache 2.0 license
 * that can be found in the LICENSE file.
 */

import java.io.File
import org.jetbrains.kotlin.dependencies.NativeDependenciesUsage

plugins {
    id("native-dependencies-downloader")
}

nativeDependenciesDownloader {
    baseUrl.set("https://cache-redirector.jetbrains.com/download.jetbrains.com/kotlin/native")
    dependenciesDir.set(rootProject.project(":kotlin-native").property("dependenciesDir") as File)

    allTargets {}
}

val allNativeDependencies: Configuration by configurations.creating {
    description = "Configuration containing all the native dependencies"
    isCanBeConsumed = false
    isCanBeResolved = true
    attributes {
        attribute(Usage.USAGE_ATTRIBUTE, objects.named(NativeDependenciesUsage.NATIVE_DEPENDENCY))
    }
}

dependencies {
    allNativeDependencies(project(":kotlin-native:dependencies"))
}

/**
 * Download all dependencies.
 */
val update by tasks.registering {
    dependsOn(allNativeDependencies)
}

// TODO: This sort of task probably belongs to :kotlin-native
val rmDotKonan by tasks.registering {
    val dir = System.getenv("KONAN_DATA_DIR") ?: "${System.getProperty("user.home")}/.konan"
    delete(dir)
}
