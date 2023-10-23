import org.jetbrains.kotlin.incremental.createDirectory

plugins {
    kotlin("multiplatform") version "1.9.0"
}

group = "me.user"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

val tmpArtifactsDirPath by extra { "tmpArtifacts/bitcode" }

kotlin {
    val aopassMode = findProperty("aopass-mode") as? String ?: "baseline"
    val validModes = setOf("baseline", "unordered", "monotonic", "seq_const", "all_to_not_atomic", "all_to_seq_const")
    if (aopassMode !in validModes) {
        throw GradleException("Unsupported `aopassMode`, please choose one of {validModes}")
    }
    val shouldProduceBitcode = gradle.startParameter.taskNames.any { it.contains("bitcode") }
    val tmpArtifactsDir = projectDir.resolve(tmpArtifactsDirPath).apply {
        if (shouldProduceBitcode && !exists()) createDirectory()
    }

    listOf(macosX64(), macosArm64(), mingwX64(), linuxX64()).forEach {
        it.compilations.getByName("main") {
            kotlinOptions.freeCompilerArgs = listOf("-Xaopass-mode=$aopassMode")
            if (shouldProduceBitcode) {
                kotlinOptions.freeCompilerArgs += "-Xtemporary-files-dir=${tmpArtifactsDir.absolutePath}"
            }
        }
        it.binaries {
            executable {
                entryPoint = "main"
                if (aopassMode != "baseline") {
                    linkerOpts += "-latomic"
                }
            }
        }
    }

    sourceSets {
        val nativeMain by creating
        val nativeTest by creating

        val macosX64Main by getting {
            dependsOn(nativeMain)
        }
        val macosArm64Main by getting {
            dependsOn(nativeMain)
        }
        val linuxX64Main by getting {
            dependsOn(nativeMain)
        }
        val mingwX64Main by getting {
            dependsOn(nativeMain)
        }

        val macosX64Test by getting {
            dependsOn(nativeTest)
        }
        val macosArm64Test by getting {
            dependsOn(nativeTest)
        }
        val linuxX64Test by getting {
            dependsOn(nativeTest)
        }
        val mingwX64Test by getting {
            dependsOn(nativeTest)
        }
    }
}

val bitcodeExtract by tasks.register("bitcodeExtract") {
    val tmpArtifactsDir = projectDir.resolve(tmpArtifactsDirPath)
    val extractBitcodeFunc = findProperty("extract-bitcode-func") as? String
    val extractBitcodeRecursive = (findProperty("extract-bitcode-recursive") as? String)?.toInt()
    val script = projectDir.resolve("../utils/analysisScripts/bitcode-extract.py")
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
                    "-c", """
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
    dependsOn(tasks.matching { it.name.startsWith("linkDebugExecutable") })
    // TODO: force linking if no tmpArtifacts
    finalizedBy(bitcodeInternal)
}

tasks.register("bitcodeRelease") {
    dependsOn(tasks.matching { it.name.startsWith("linkReleaseExecutable") })
    finalizedBy(bitcodeInternal)
}
