# Benchmarking scripts documentation

Here you can find brief description of how to use bash benchmarking scripts located in the [benchmarkingScripts](./) directory.

The *usage* sections notation:
* double quotes `"..."` mean string argument;
* `$arg_name` means an argument that named as `arg_name` (and corresponding variable in the bash syntax);
* square brackets `[...]` mean argument inside them is optional;
* pipe `|` sign delimits different options.

Besides, "aopass" in the text simply stands for "atomic ordering pass".

## Important notes

* All scripts are expected to be executed only from the [benchmarkingScripts](./) directory.
* All scripts can be run on both *Linux x64* and *MacOS Arm64* machines, described in the [RESEARCH_MACHINES.md](../../benchmarkReports/RESEARCH_MACHINES.md). However, scripts should be manulally verified before using on another machines.

## Build the Kotlin/Native compiler: [`buildCompiler.sh`](./buildCompiler.sh)

Builds the compiler, optionally doing cleanup beforehand.

### Usage

```bash
./buildCompiler.sh ["fresh" | "-f"]
```
* When either `"fresh"` or `"-f"` are specified, the script performs cleanup before starting the build. In this case, the compiler build can be called *fresh*, that is, fully consistent with the project code for sure. 

*Hint:* however, in most situations, Gradle performs build correctly without any cleanup.

### Examples
* Simply builds the compiler.
    ```bash
    ./buildCompiler.sh
    ```
* Builds the compiler, but with cleanup beforehand.
    ```bash
    ./buildCompiler.sh -f
    ```

## Run aopass benchmarks: [`runAopassBenchmarks.sh`](./runAopassBenchmark.sh)

Runs specified benchmark tests for the specified aopass configuration and saves their results in the [`kotlin-native/performance/build`](../../../performance/build/) directory.

*Hint:* the aopass configuration can also be a baseline compiler.

### Usage

```bash
./runAopassBenchmarks.sh $run_name [$aopass_mode] [$attempts_number] [$test_task] [$filter_tests]
```
```bash
# available $aopass_mode-s:
"baseline" | "unordered" | "monotonic" | "seq_const" | "all_to_not_atomic" | "all_to_seq_const"
```
* `$run_name` is the tag of the run, which will be used in the resulting report name: `"$run_name".json` in the [`kotlin-native/performance/build`](../../../performance/build/) directory.
  * If it is the single argument present, then it should correspond to one of the valid `$aopass_mode`-s. Then all benchmarks in this configuration will be executed.
* `$aopass_mode` specifies the atomic ordering pass configuration that will be used by the compiler. Although you can read more about available modes in [README.md](../../README.md), `$aopass_mode` means all *NotAtomic* orderings will be replaced with ones specified in the mode's name.
* `$attempts_number` defines the number of attempts to run each benchmarking test before evaluating their average result. The default number of attempts is `20`.
* `$test_task` defines the gradle task to run the benchmarks. The default one is `:konanRun` that runs all the benchmarking tests. Examples of other options are `:cinterop:konanRun` and `:ring:konanRun`, that run [`Cinterop`](../../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/) and [`Ring`](../../../performance/ring/src/main/kotlin/org/jetbrains/ring/) test suites respectively.
* `$filter_tests` defines the filter to be applied to the tests' names to run only the chosen ones. Besides, this argument should be specified in the form of the flag. There are two options:
  * `"--filter=..."` specifies the exact names of the tests;
    * for example, `--filter=int,boxedInt` selects only `int` and `boxedInt` tests from the suit specified before;
  * `"--filterRegex=..."` specifies the regex expression to choose the tests;
    * for example, `--filterRegex=MultithreadedLoops.*` selects all the tests, whose names start with `MultithreadedLoops.`. 

*Important note:* unfortunately, no argument can be specified without specifying the previous one, and their order is important.

### Examples

* Runs all benchmarks for the `unordered` aopass configuration with `20` attempts for each test and saves results to the `unordered.json`.
    ```bash
    ./runAopassBenchmarks.sh unordered
    ```
* Runs all benchmarks for the `baseline` compiler with `20` attempts for each test and saves results to the `baseline2.json`.
    ```bash
    ./runAopassBenchmarks.sh baseline2 baseline
    ```
* Runs all benchmarks for the `baseline` compiler with `30` attempts for each test and saves results to the `30-attempts.json`.
    ```bash
    ./runAopassBenchmarks.sh 30-attempts baseline 30
    ```
* Runs the `Cinterop` test suite for the `baseline` compiler with `30` attempts for each test and saves results to the `30-attempts-cinterop.json`.
    ```bash
    ./runAopassBenchmarks.sh 30-attempts-cinterop baseline 30 :cinterop:konanRun
    ```
* The same as in example above, but only `Cinterop:int` and `Cinterop:boxedInt` tests are being run.
  ```bash
  ./runAopassBenchmarks.sh 30-attempts-cinterop baseline 30 :cinterop:konanRun --filter=int,boxedInt
  ```
* Runs all the `Ring` suite test, whose names start with `MultithreadedLoops.`, for the `baseline` compiler with `30` attempts for each test and saves results to the `30-attempts-multithreading.json`.
    ``` bash
    ./runAopassBenchmarks.sh 30-attempts-multithreading baseline.kt 30 :ring:konanRun --filterRegex=MultithreadedLoops.*
    ```

## Build the `benchmarksAnalyzer` tool: [`buildBenchmarksAnalyzer.sh`](./buildBenchmarksAnalyzer.sh)

Simply builds the `benchmarksAnalyzer` tool, which can be used to compile comparison reports of different configurations runs afterwards. 

### Usage

```bash
./buildBenchmarksAnalyzer.sh
```

## Compile two benchmarking result `.json` files into a comparison `.html` report: [`compareResults.sh`](./compareResults.sh)

Assume: 
* you have two benchmark results saved in `.json` files in the in the [`kotlin-native/performance/build`](../../../performance/build/) directory;
* `benchmarksAnalyzer` tool is already built.

Then, this script compiles specified `.json` files into a comparison `.html` report in the [`kotlin-native/tools/benchmarksAnalyzer/results`](../../../tools/benchmarksAnalyzer/results) directory.

### Usage

```bash
./compareResults.sh $target_pass_name $baseline_pass_name
```
* `$target_pass_name` defines the configuration that will be compared relative to the second one. 
  * The `"$target_pass_name".json` file should exist in the the [`kotlin-native/performance/build`](../../../performance/build/) directory.
* `$baseline_pass_name` defines the configuration that will be used as a base one in the comparison.
  * The `"$baseline_pass_name".json` file should exist in the the [`kotlin-native/performance/build`](../../../performance/build/) directory too.

The resulting comparison `.html` report will be saved as a `"$target_pass_name"-vs-"$baseline_pass_name".html` in the [`kotlin-native/tools/benchmarksAnalyzer/results`](../../../tools/benchmarksAnalyzer/results) directory.

### Examples

* Compiles `unordered.json` and `baseline.json` benchmarking result files into a comparison `unordered-vs-baseline.html` report.
    ```bash
    ./compareResults.sh unordered baseline
    ```

## Top-level scripts

Several top-level scripts can be used to run the whole benchmarking pipeline in the certain configurations useful for our research. Besides, these scripts provide insights into creating custom top-level scripts easily.  

* [`./benchmarkUnordered.sh`](./benchmarkUnordered.sh) creates `20` comparison reports of the `unordered` vs `baseline` configurations in the final framework setup (i.e. with `30` attempts for each test; while `benchmarkSize = 20,000` should be set manually). Their results are described in the [UNORDERED_VS_BASELINE_RESULTS.md](../../benchmarkReports/compilation-schemes-comparison/UNORDERED_VS_BASELINE_RESULTS.md) report.
* [`./benchmarkAllPassesPreliminary.sh`](./benchmarkAllPassesPreliminary.sh) creates all preliminary comparisons of various aopass configurations. Their results are described in the [PRELIMINARY_RESULTS.md](../../benchmarkReports/compilation-schemes-comparison/PRELIMINARY_RESULTS.md) report.
* [`./testPipeline.sh`](./testPipeline.sh) is a test script that can be used to verify the benchmarking pipeline is working properly. If everything is alright, the valid comparison report `test-vs-test.html` will be generated. It takes about 10 minutes on the *Linux~x64* machine to run this script.