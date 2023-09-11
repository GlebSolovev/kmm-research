# Change Atomic Ordering Pass Benchmarking

Main goal is to _**change atomic ordering of memory accesses**_ (from `NotAtomic` to `Unordered`, for example) using an implemented bitcode pass in the Kotlin Native compiler and _**test the resulting bitcode and performance**_.

## Navigation

This project directory contains several `.md` files, that explain the structure of the repository and the whole research process, as well as its final results.

* This [README.md](./README.md) contains brief practical information on building a modified compiler and running, analyzing and adding benchmark tests.
* The [ABOUT_KN_BENCHMARKS.md](./benchmarkReports/ABOUT_KN_BENCHMARKS.md) file introduces the structure of the Kotlin/Native benchmarking framework, as well as their shortcomings and how to overcome the issues.
* The [RESEARCH_MACHINES.md](./benchmarkReports/RESEARCH_MACHINES.md) document contains an overview of the technical characteristics of the machines used in the research.
* The [NOISE_ANALYSIS_REPORT.md](./benchmarkReports/noise-analysis/NOISE_ANALYSIS_REPORT.md) describes the techniques (and their development process) that we used to deal with noise in the results of the Kotlin/Native benchmarks.
* The [PRELIMINARY_RESULTS.md](./benchmarkReports/compilation-schemes-comparison/PRELIMINARY_RESULTS.md) report describes the preliminary results of different simple compilation schemes comparisons, that we obtained in the beggining of the research.
* The [UNORDERED_VS_BASELINE_METHODOLOGIE.md](./benchmarkReports/compilation-schemes-comparison/UNORDERED_VS_BASELINE_METHODOLOGIE.md) report describes the way we conducted the final evaluation of performance degradation of *NotAtomic* to *Unordered* change.
* Finally, the [UNORDERED_VS_BASELINE_RESULTS.md](./benchmarkReports/compilation-schemes-comparison/UNORDERED_VS_BASELINE_RESULTS.md) briefly reports the main research results, i.e. the preformance degradation of `NotAtomic` to `Unordered` change.

Additionally, the [BENCHMARKING_SCRIPTS_DOCUMENTATION.md](./utils/benchmarkingScripts/BENCHMARKING_SCRIPTS_DOCUMENTATION.md) describes the usage of the bash scripts used to automatize the benchmarking process.
  
## Intro: project setup

[Here](../README.md), in the _Building from source_ section, you can find necessary prerequisites for building the compiler and get acquainted with building the project in general.

Notes below will help you learn how to solve the most common problems with ease.

### Create `local.properties` file

At the root of the project, you will most likely need to create a `local.properties` file once with the following content:
* for *Linux*:
  ```
  kotlin.native.enabled=true
  ```
* for *MacOS*:
  ```
  kotlin.native.enabled=true
  kotlin.build.isObsoleteJdkOverrideEnabled=true
  ```
The first `kotlin.native.enabled=true` line is just necessary, while the `...ObsoleteJdk..` one will avoid using (and, therefore, installing) `JDK_1_6` and `JDK_1_7` in *MacOS* (in *Linux*, unfortunately, it causes a build error).

### Set up proper `Xcode` version on *MacOS*

In case of a *MacOS* machine, building the kotlin-native project currently requires the `14` version of `Xcode`. If another version is set by default on your machine, the build will fail due to a corresponding `Xcode` version check or sometimes due to an error about missing some library files.

To check the `Xcode` version, that will be used during the build, run this command:
```bash
/usr/bin/xcodebuild -version
```
The output major version should be `14` (for example, `Xcode 14.1` is fine).

If this condition isn't fulfilled, you should set the proper `Xcode` version. Perhaps, there is one already installed on your machine, then it's enough to set the `DEVELOPER_DIR` environment variable to its path. For example, it can be done in the following way:
```bash
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
``` 

## Pass implementation

* See implementation of pass in [ChangeAtomicOrdering.kt](../backend.native/compiler/ir/backend.native/src/org/jetbrains/kotlin/backend/konan/aopass/ChangeAtomicOrdering.kt). By default, no changes are made (i.e. the baseline configuration is set).
* The core `changeAtomicOrdering` function is wrapped in `ChangeAtomicOrderingPhase` in [Bitcode.kt](../backend.native/compiler/ir/backend.native/src/org/jetbrains/kotlin/backend/konan/driver/phases/Bitcode.kt);
* The wrapper (i.e. the phase) is then called at the `compileModule` function in [TopLevelPhases.kt](../backend.native/compiler/ir/backend.native/src/org/jetbrains/kotlin/backend/konan/driver/phases/TopLevelPhases.kt).

Also, several util functions were added to [LlvmUtils.kt](../backend.native/compiler/ir/backend.native/src/org/jetbrains/kotlin/backend/konan/llvm/LlvmUtils.kt).

## Compile a small project

One can build their own code using the modified compiler (i.e. with atomic ordering pass enabled), check output bitcode and benchmark the compiled program performance.

* Project directory can be found [here](testOnSmallProject).
* For now, the project consists of a single file [Main.kt](testOnSmallProject/src/nativeMain/kotlin/Main.kt). Currently, it contains one of the simplest and most illustrative benchmarks from [`ForLoopsBenchmark.kt`](../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt).

### Build modified compiler

Before testing the custom compiler it's important to make sure it's built! Run from the root ([kmm-research](../..)) directory:

```bash
./gradlew :kotlin-native:dist
```

Built compiler directory can be found in [../dist](../dist) (relative to this file). From now on, that directory will be referred to as `$COMPILER_DIST`.

### Use the custom compiler... manually

To built your code with the custom compiler run from this directory:

```bash
$COMPILER_DIST/bin/kotlinc-native -linker-options="-latomic" testOnSmallProject/src/nativeMain/kotlin/Main.kt -o output 
```

where output executable file is `output.kexe`. Also, `-opt` can be passed to the compiler to enable optimizations.<br/>
P. S. `-linker-options="-latomic"` is necessary, because atomic accesses can appear as a result of the atomic ordering pass.

### Use the custom compiler... with Gradle

The `kotlin.native.home` variable in [`gradle.properties` file](testOnSmallProject/gradle.properties) should be set to `$COMPILER_DIST`. This option can be overridden by passing a flag `-Pkotlin.native.home=$COMPILER_DIST` to any of the commands below.

Then, `cd` to [`testOnSmallProject`](testOnSmallProject) and run:

* `./gradlew linkDebugExecutableLinuxX64` to only build the project (find the executable in `build/bin/linuxX64/releaseExecutable`);
* `./gradlew runDebugExecutableLinuxX64` to build and run the project immediately.

To enable compiler optimizations one should use slightly different tasks: `./gradlew linkReleaseExecutableLinuxX64` and `./gradlew runReleaseExecutableLinuxX64` respectively.

Of course, these tasks work only for *Linux x64* platform. To build the project for a different architecture use a similar task with the corresponding name.

### Obtain result bitcode

For now, we don't know any working solution that uses Gradle. Moreover, currently we don't know any way to obtain a short bitcode from a short source file: *it is always littered with the included libraries* (see the scripts, which try to mitigate this issue).

However, verbose bitcode of the input code can be obtained via *calling the compiler manually* as follows.

* To get the program bitcode run from this directory:

  ```bash
  $COMPILER_DIST/bin/kotlinc-native testOnSmallProject/src/nativeMain/kotlin/Main.kt -opt -Xtemporary-files-dir="temp-files-dir" -o "main.kexe"
  ```

  where `temp-files-dir` is an output directory that contains the target bitcode file `out.bc`. 

  P.S. To link a code with atomics you may need to add `-linker-options="-latomic"` flag.

* However, to make it human-readable the `llvm-dis` tool can be used:
  ```bash
  llvm-dis "temp-files-dir/out.bc" -o "bitcode.ll"
  ```
  where `bitcode.ll` is the desired bitcode of the original program.

Sample bitcode obtained by this command can be found in `bitcode` directory. # TODO (!!!!!! + check whether output file name is needed)

### Run a simple benchmark (legacy)

To measure execution time of the built program two simple scripts can be used. They can be found in `testOnSmallProject/scripts` directory.

* `avgTime.sh` is used for measuring average program execution time for a given number of repeats;
* `measureCompiler.sh` executes measurements for all 4 combinations of compiler execution: (manually / via Gradle) and (with / without) optimizations enabled.

To get benchmark results run from `testOnSmallProject` directory:

```bash
./scripts/measureCompiler.sh $COMPILER_DIST src/nativeMain/kotlin/Main.kt
```

Output will be shown in stdout.

This method of benchmarking _**is legacy**_. Its main goal was to check that all variants for calling the compiler are properly working and to compare their performance in the simplest way. To run proper benchmarks, even for custom tests, see the section below.

## Proper benchmarking

Proper benchmarking could be done using Kotlin/Native benchmarking framework.

* Firstly, set desired atomic orderings in [ChangeAtomicOrdering.kt](../backend.native/compiler/ir/backend.native/src/org/jetbrains/kotlin/backend/konan/aopass/ChangeAtomicOrdering.kt) file.
* Second, the project should be built. 
  * Run `./gradlew clean` from the project root. Since the change-atomic-ordering pass impacts not only the target code but libraries too, they must also be rebuilt.
  * Then, bundle version of compiler should be built: run `./gradlew :kotlin-native:bundle` from the project root too.
  * Finally, run `./gradlew -stop`. In practice, this reduces the likelihood of an unexpected crash of benchmarks (which is out of our control).
* Then, go to [`kotlin-native/performance`](../performance) and start benchmarks:

    ```bash
    ../../gradlew :konanRun -PnativeJson=output.json
    ```

  where benchmark results will be contained in `build/output.json`.
  * To set the number of repeats of each benchmark task, pass a `-Pattempts=5` flag (`5` here is for example, its default value is `20`).
  * To run benchmarks exclusively for certain tasks call a needed test suit task and use a `--filter=` or `--filterRegex=` flag. For example:
    ```bash
    ../../gradlew :ring:konanRun -PnativeJson=output.json --filterRegex=Fibonacci.*
    ```
  * Compiler optimizations are enabled by default. To disable them, add a `-PnativeBuildType=DEBUG` flag.
* Run benchmarks as described above for different compiler configurations (i.e. with different atomic orderings being changed) and save the results.
* Finally, we will use a special tool to compare the obtained results. When benchmarking for the first time, it has to be built by executing the following commands from the root directory:
  ```bash
    ./gradlew linux_x64PlatformLibs
    cd kotlin-native/tools/benchmarksAnalyzer
    ../../../gradlew build
  ```
  Now two benchmark results (named `output-1.json` and `output-2.json` for example) can be compared using the following command:
  ```bash
    ./build/bin/linux/benchmarksAnalyzerReleaseExecutable/benchmarksAnalyzer.kexe output-1.json output-2.json -f -r html -o compare.html
  ```
  where `compare.html` is the analysis result file. Unfortunately, only two files can be compared at the same time.

Original guide for performance measurement can be found [here](../HACKING.md), in the _Performance measurement_ section.

P. S. Of course, the commands above are valid for *Linux x64* platform, others will require corresponding names changed.

### Benchmarking scripts

To automate the benchmarking of different passes, the scripts in [`utils`](utils) directory can be used. They are not especially smart, but are extremely useful. 
* The [`passTemplates`](utils/passTemplates) directory contains templates of different passes (that is, versions of the [ChangeAtomicOrdering.kt](../backend.native/compiler/ir/backend.native/src/org/jetbrains/kotlin/backend/konan/aopass/ChangeAtomicOrdering.kt) file). 
* The [`benchmarkingScripts`](utils/benchmarkingScripts) directory contains the scripts themselves. So far, they support both *Linux x64* and *MacOS Arm64*, but can be easily adapted to any other platforms. 
  
The documentation for the benchmarking scripts can be found in the [BENCHMARKING_SCRIPTS_DOCUMENTATION.md](./utils/benchmarkingScripts/BENCHMARKING_SCRIPTS_DOCUMENTATION.md) file.

The entry point script to obtain preliminary results is [`benchmarkAllPassesPreliminary.sh`](./utils/benchmarkingScripts/benchmarkAllPassesPreliminary.sh). That is, to reproduce the results described in the [PRELIMINARY_RESULTS.md](./benchmarkReports/compilation-schemes-comparison/PRELIMINARY_RESULTS.md), it is enough to run the script from the [`benchmarkingScripts`](utils/benchmarkingScripts) directory:
```bash
./benchmarkAllPassesPreliminary.sh
 ```
You can find more details on the order of execution of certain commands and more useful tricks in the scripts' code.

### How to add a new benchmark test

It's pretty straightforward: place your test in a separate class in [this directory](../performance/ring/src/main/kotlin/org/jetbrains/ring) and plug into `baseBenchmarksSet` [here](../../kotlin-native/performance/ring/src/main/kotlin/main.kt). 

This is a way to add a test to the `Ring` suite. You can create your suite by analogy with the ones in the [`performance`](../performance) directory. 
