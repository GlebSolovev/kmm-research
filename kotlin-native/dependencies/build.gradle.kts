/*
 * Copyright 2010-2023 JetBrains s.r.o. Use of this source code is governed by the Apache 2.0 license
 * that can be found in the LICENSE file.
 */

import java.io.File
import org.jetbrains.kotlin.dependencies.NativeDependencies

plugins {
    id("native-dependencies")
}

nativeDependencies {
    baseUrl.set("https://cache-redirector.jetbrains.com/download.jetbrains.com/kotlin/native")
    dependenciesDir.set(rootProject.project(":kotlin-native").property("dependenciesDir") as File)

    allTargets {}
}

/**
 * Download all dependencies.
 */
val update by tasks.registering {
    dependsOn(tasks.withType<NativeDependencies>())
}

// TODO: This sort of task probably belongs to :kotlin-native
val rmDotKonan by tasks.registering {
    val dir = System.getenv("KONAN_DATA_DIR") ?: "${System.getProperty("user.home")}/.konan"
    delete(dir)
}
