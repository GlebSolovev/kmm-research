/*
 * Copyright 2010-2019 JetBrains s.r.o. Use of this source code is governed by the Apache 2.0 license
 * that can be found in the LICENSE file.
 */

import org.jetbrains.kotlin.gradle.plugin.mpp.KotlinNativeTarget
import org.jetbrains.kotlin.incremental.createDirectory

plugins {
    id("benchmarking")
}

benchmark {
    applicationName = "Ring"
    commonSrcDirs = listOf("../../tools/benchmarks/shared/src/main/kotlin/report", "src/main/kotlin", "../shared/src/main/kotlin")
    jvmSrcDirs = listOf("src/main/kotlin-jvm", "../shared/src/main/kotlin-jvm")
    nativeSrcDirs = listOf("src/main/kotlin-native", "../shared/src/main/kotlin-native/common")
    mingwSrcDirs = listOf("src/main/kotlin-native", "../shared/src/main/kotlin-native/mingw")
    posixSrcDirs = listOf("src/main/kotlin-native", "../shared/src/main/kotlin-native/posix")
}

val tmpArtifactsDirPath by extra { "tmpArtifacts/bitcode" }

val native = kotlin.targets.getByName("native") as KotlinNativeTarget
native.compilations["main"].apply {
    val compilerArgs = mutableListOf<String>()

    val aopassMode = findProperty("aopass-mode") as? String ?: "baseline"
    val validModes = setOf("baseline", "unordered", "monotonic", "seq_const", "all_to_not_atomic", "all_to_seq_const")
    if (aopassMode !in validModes) {
        throw GradleException("Unsupported `aopassMode`, please choose one of {validModes}")
    }
    compilerArgs += "-Xaopass-mode=$aopassMode"
    if (aopassMode != "baseline"){
        compilerArgs += "-linker-options=-latomic"
    }

    if (gradle.startParameter.taskNames.any { it.contains("bitcode") }) {
        val tmpArtifactsDir = projectDir.resolve(tmpArtifactsDirPath).apply {
            if (!exists()) createDirectory()
        }
        compilerArgs += "-Xtemporary-files-dir=${tmpArtifactsDir.absolutePath}"
    }
    
    // pass compiler args to the building stage
    compilerOptions
        .options
        .freeCompilerArgs
        .addAll(compilerArgs)
    // pass compiler args to the linking stage
    rootProject.ext.set("compilerArgs", compilerArgs.joinToString(" ")) 
    // TODO: find a way to add flags to property
}

val bitcodeExtract by tasks.register("bitcodeExtract") {
    val tmpArtifactsDir = projectDir.resolve(tmpArtifactsDirPath)
    val script = projectDir.resolve("../../aoPassBenchmarking/utils/analysisScripts/bitcode-extract.py")
    val extractBitcodeFunc = findProperty("extract-bitcode-func") as? String
    val extractBitcodeRecursive = (findProperty("extract-bitcode-recursive") as? String)?.toInt()
    doLast {
        exec {
            executable = "sh"
            args = listOf(
                    "-c", """
                 python3 ${script} -i ${tmpArtifactsDir.resolve("bitcode.ll")} -o ${tmpArtifactsDir.resolve("extracted-bitcode.ll")} -func '$extractBitcodeFunc' -r '$extractBitcodeRecursive'
             """.trimIndent()
            )
        }
    }
    // TODO: handle flags more carefully
}

val bitcodeInternal by tasks.register("bitcodeInternal") {
    val tmpArtifactsDir = projectDir.resolve(tmpArtifactsDirPath)
    val bcFile = tmpArtifactsDir.resolve("out.bc")
    doLast {
        exec {
            executable = "sh"
            args = listOf(
                "-c",
                """
                llvm-dis -o ${tmpArtifactsDir.resolve("bitcode.ll")} ${tmpArtifactsDir.resolve("out.bc")}
                """.trimIndent()
            )
            // TODO: support passing build mode name
            // TODO: support passing bitcode file name
        }
        delete(tmpArtifactsDir.resolve("result.o"))
        copy {
            from(bcFile)
            into(tmpArtifactsDir)
            rename { _ -> "bitcode.bc" }
        }
//        delete(bcFile) // TODO: handle properly (use bitcode.bc above) / move to build dir
    }
    if (findProperty("extract-bitcode-func") != null) {
        finalizedBy(bitcodeExtract)
    }
}

tasks.register("bitcodeDebug") {
    dependsOn(tasks.matching { it.name.startsWith("linkBenchmarkDebugExecutable") })
    // TODO: force linking if no tmpArtifacts
    finalizedBy(bitcodeInternal)
}

tasks.register("bitcodeRelease") {
    dependsOn(tasks.matching { it.name.startsWith("linkBenchmarkReleaseExecutable") })
    finalizedBy(bitcodeInternal)
}
