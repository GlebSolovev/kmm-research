import org.jetbrains.kotlin.gradle.tasks.KotlinJvmCompile

plugins {
    kotlin("jvm")
    id("jps-compatible")
    id("java-test-fixtures")
}

publish()

standardPublicJars()

dependencies {
    implementation(kotlinStdlib())
    implementation(project(":kotlin-tooling-core"))
    testApi(platform(libs.junit.bom))
    testImplementation(libs.junit.jupyter.api)
    testRuntimeOnly(libs.junit.jupyter.engine)
    testImplementation(libs.junit.platform.runner)
    testFixturesImplementation(project(":kotlin-tooling-core"))
    testFixturesImplementation(project(":core:util.runtime"))
    testFixturesImplementation(projectTests(":generators:test-generator"))
    testFixturesImplementation(commonDependency("org.jetbrains.kotlin:kotlin-reflect")) { isTransitive = false }
    testFixturesImplementation(libs.junit.jupyter.api)
}

projectTest(jUnitMode = JUnitMode.JUnit5) {
    useJUnitPlatform()
}

configureKotlinCompileTasksGradleCompatibility()

tasks.named<KotlinJvmCompile>("compileTestFixturesKotlin") {
    kotlinOptions {
        freeCompilerArgs += listOf(
            "-XXLanguage:+AllowSealedInheritorsInDifferentFilesOfSamePackage",
            "-XXLanguage:+SealedInterfaces",
            "-Xjvm-default=all"
        )
    }
}

tasks.named<Jar>("jar") {
    manifestAttributes(manifest)
}
