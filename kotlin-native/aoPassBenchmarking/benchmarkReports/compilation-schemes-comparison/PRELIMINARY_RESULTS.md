# Preliminary benchmark results

At the beginning of the work, we did preliminary experiments with the default parameters: running the full test suite, `x1` tests size (i.e. `BENCHMARK_SIZE = 10_000`) and `attempts = 20`. Their brief summary and interpretation can be found below.

In addition, to develop and test a system for the final evaluation of results, we conducted multiple preliminary experiments comparing the `Unordered` compilation scheme with baseline on full tests, `x0.1` tests size (i.e. `BENCHMARK_SIZE = 1000`) and `attempts = 35`. Their results can be found in directory [macosArm64/preliminary/unordered-vs-baseline-full-x0.1-35](macosArm64/preliminary/unordered-vs-baseline-full-x0.1-35). However, these data are auxiliary and will not be analyzed in this report.

## File naming convention

*Most* of preliminary reports can be found in [macosArm64/preliminary/all-comparisons-full-x1-20](macosArm64/preliminary/all-comparisons-full-x1-20) and [linuxX64/preliminary/all-comparisons-full-x1-20](linuxX64/preliminary/all-comparisons-full-x1-20) directories.

* `baseline` and `baseline[2,3,...]` stand for compiler runs, empty of any modifications;
* `unordered`, `monotonic` and `seq` stand for replacing any accesses `NotAtomic` to `Unordered`, `Monotonic` and `SequentiallyConsistent` correspondingly;
* `all-to-seq` and `all-to-not-atomic` stand for replacing _all_ accesses to `SequentiallyConsistent` and `NotAtomic` correspondingly, these are extreme cases that can be used only for validation.

Naturally, `vs` means comparison of two compiler modifications. All benchmarks were run with `-opt` flag (i.e. with optimization enabled), this is a target case: changing modes of accesses mainly affects the number of available optimizations for the compiler.

## Interpretation: key points

While the geometric mean helps to estimate the improvement or deterioration on average, it is not very revealing: the most important are _**the specific microbenchmarks**_ on which the greatest deterioration is achieved. They demonstrate the real consequences of compiler changes, while other microbenchmarks, most likely, are simply not related to the changes made. That is why for each case both the geometric mean value for all tests and a list of specific tests with the greatest deterioration is given.

About _**the score**_. All score change percentages are relative to the largest of the compared values. Presumably, the score itself is calculated depending on the execution time of the benchmarks.

A note _**about *Linux x64***_. As the results below show, *Linux x64* has higher degradation percentages in the individual tests. However, it is also higher when comparing several versions of the baseline, which means that there was surely more noise on this machine (and/or architecture?). Moreover, there was more improvement in test performance on this machine than on *MacOS Arm64*, so the average *Linux x64* results sometimes turned out to be much lower. In the final experiments, we got rid of this noise and made evaluation properly.

## Baselines comparison

Comparison of two baseline runs demonstrate how significant the error between same compiler benchmarks can be, i.e. the noise level. One of the current tasks is to get rid of such noise.

In this section, all test names are clickable and lead to source files with their code.

### *MacOS Arm64*

<ins>baseline2-vs-baseline</ins>

_Geometric mean:_ 0.00 ± 0.00 %

_Tests with an observable score difference:_
* [`Ring::ForLoops.uShortArrayIndicesLoop`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt) (17%)
* [`Cinterop::boxedInt`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (13%)
* [`Cinterop::int`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (5%)
* [`Ring::ClassArray.filter`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassArrayBenchmark.kt) (4%)
* `swiftInterop::WeakRefBenchmark.aliveReference` [[Swift source code](../../performance/swiftinterop/swiftSrc/weakRefBenchmarks.swift)] (4%)
* [`Ring::LocalObjects.localArray`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/LocalObjectsBenchmark.kt) (3%)
* [`Ring::ClassStream.countFilteredManual`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassStreamBenchmark.kt) (3%)
* [`Ring::DefaultArgument.testOneOfEight`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/DefaultArgumentBenchmark.kt) (2%)
* [`Ring::CompanionObject.invokeRegularFunction`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/CompanionObjectBenchmark.kt) (2%)
* [`Ring::ClassList.countWithLambda`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassListBenchmark.kt) (2%)
* [`Ring::ClassArray.filterAndMap`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassArrayBenchmark.kt) (1%)
* [`Ring::ClassArray.filterAndCount`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassArrayBenchmark.kt) (1%)
* [`Ring::ClassArray.countFiltered`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassArrayBenchmark.kt) (1%)

<ins>baseline3-vs-baseline</ins>

_Geometric mean:_ 0.00 ± 0.00 %

_Tests with an observable score difference:_ 
* [`Cinterop::int`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (27%)
* [`Cinterop::boxedInt`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (13%)
* [`Ring::ClassList.reduce`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassListBenchmark.kt) (5%)
* `swiftInterop::WeakRefBenchmark.aliveReference` [[Swift source code](../../performance/swiftinterop/swiftSrc/weakRefBenchmarks.swift)] (4%)
* [`Ring::LocalObjects.localArray`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/LocalObjectsBenchmark.kt) (3%)
* [`Ring::DefaultArgument.testTwoOfTwo`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/DefaultArgumentBenchmark.kt) (2%)
* [`Ring::Switch.testDenseEnumsSwitch`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/SwitchBenchmark.kt) (2%)
* [`Ring::AbstractMethod.sortStringsWithComparator`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/AbstractMethodBenchmark.kt) (2%)
* [`Ring::IntArray.countFiltered`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/IntArrayBenchmark.kt) (1%)

### *Linux x64*

<ins>baseline2-vs-baseline</ins>

_Geometric mean:_ 0.00 ± 0.00 %

_Tests with an observable score difference:_
* [`Ring::ClassStream.copy`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassStreamBenchmark.kt) (51%)
* [`Cinterop::boxedInt`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (28%)
* [`Cinterop::int`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (24%)
* [`Ring::ClassList.filterAndMap`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassListBenchmark.kt) (22%)
* [`Ring::Euler.problem8`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/EulerBenchmark.kt) (20%)
* [`Ring::DefaultArgument.testEightOfEight`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/DefaultArgumentBenchmark.kt) (18%)
* [`Ring::IntStream.copy`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/IntStreamBenchmark.kt) (8%)
* [`Ring::IntList.copy`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/IntListBenchmark.kt) (6%)
* other 17 tests with score difference showed <= 5% of gap

<ins>baseline3-vs-baseline</ins>

_Geometric mean:_ 0.00 ± 0.00 %

_Tests with an observable score difference:_
* [`Ring::ClassList.filterAndMap`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassListBenchmark.kt) (21%)
* [`Ring::Euler.problem8`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/EulerBenchmark.kt) (20%)
* [`Cinterop::boxedInt`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (19%)
* [`Ring::DefaultArgument.testOneOfTwo`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/DefaultArgumentBenchmark.kt) (18%)
* [`Ring::ChainableBenchmark.testChainable`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ChainableBenchmark.kt) (10%)
* [`Ring::WeakRefBenchmark.deadReference`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/WeakRefBenchmark.kt) (6%)
* [`Ring::String.stringBuilderConcat`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/StringBenchmark.kt) (5%)
* [`Ring::ClassBaseline.allocateArray`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassBaselineBenchmark.kt) (5%)
* other 16 tests with score difference showed < 5% of gap

## unordered-vs-baseline

This is _**a target research case**_: to study how replacing `NotAtomic` accesses with `Unordered` will degrade the performance of Kotlin Native programs. 

In this section, all test names are clickable and lead to source files with their code.

### *MacOS Arm64*

_Geometric mean:_ 0.14 ± 0.20 % of degradation

_Tests with the most significant score degradation:_
* [`Cinterop::boxedInt`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (37%)
* [`Ring::CompanionObject.invokeRegularFunction`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/CompanionObjectBenchmark.kt) (19%)
* [`Ring::Calls.parameterBoxUnboxFolding`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/CallsBenchmark.kt) (18%)
* [`Ring::ForLoops.intArrayIndicesLoop`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt) (17%)
* [`Ring::ForLoops.intArrayLoop`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt) (17%)
* [`Ring::ForLoops.uIntArrayIndicesLoop`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt) (13%)
* [`Ring::String.summarizeSplittedCsv`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/StringBenchmark.kt) (9%)
* [`Ring::ChainableBenchmark.testChainable`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ChainableBenchmark.kt) (9%)
* [`Cinterop::stringToC`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (9%)
* [`Ring::ClassList.countWithLambda`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassListBenchmark.kt) (6%)
* [`Ring::String.stringConcat`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/StringBenchmark.kt) (6%)
* [`Ring::BunnymarkBenchmark.testBunnymark`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/BunnymarkBenchmark.kt) (5%)
* other 24 tests with score degradation achieved < 5% of change

### *Linux x64*

_Geometric mean:_ 0.00 ± 0.00 % of degradation

_Tests with the most significant score degradation:_
* [`Ring::ForLoops.charArrayLoop`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt) (48%)
* [`Ring::ForLoops.uLongArrayLoop`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt) (46%)
* [`Ring::Fibonacci.calcClassic`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/FibonacciBenchmark.kt) (41%)
* [`Ring::ForLoops.stringLoop`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ForLoopsBenchmark.kt) (31%)
* [`Cinterop::int`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (23%)
* [`Cinterop::boxedInt`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (23%)
* [`Ring::Euler.problem9`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/EulerBenchmark.kt) (18%)
* [`Ring::IntArray.countFilteredSome`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/IntArrayBenchmark.kt) (17%)
* [`Ring::String.summarizeSplittedCsv`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/StringBenchmark.kt) (13%)
* [`Ring::Euler.problem1`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/EulerBenchmark.kt) (10%)
* [`Cinterop::stringToC`](../../performance/cinterop/src/main/kotlin-native/org/jetbrains/cinteropBenchmarks/typesBenchmark.kt) [[C source code](../../performance/cinterop/src/nativeInterop/cinterop/types.def)] (9%)
* [`Ring::String.stringBuilderConcat`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/StringBenchmark.kt) (8%)
* [`Ring::Calls.interfaceMethodHexamorphic`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/CallsBenchmark.kt) (8%)
* [`Ring::String.stringBuilderConcatNullable`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/StringBenchmark.kt) (8%)
* [`Ring::ClassBaseline.consumeField`](../../performance/ring/src/main/kotlin/org/jetbrains/ring/ClassBaselineBenchmark.kt) (7%)
* other 28 tests with score degradation achieved <= 5% of change

## monotonic-vs-baseline

This is a further research case: to check how replacing `NotAtomic` accesses with an even stronger `Monotonic` mode will degrade the performance.

### *MacOS Arm64*

_Geometric mean:_ 5.06 ± 0.19 % of degradation

_Tests with the most significant score degradation:_
* `Ring::Inheritance.baseCalls` (53%)
* `Ring::BunnymarkBenchmark.testBunnymark` (37%)
* `Cinterop::boxedInt` (35%)
* `Ring::Calls.interfaceMethodHexamorphic` (29%)
* `Ring::CompanionObject.invokeRegularFunction` (27%)
* `Ring::Switch.testSealedWhenSwitch` (24%)
* `Ring::Switch.testObjConstSwitch` (23%)
* `Ring::Loop.arrayListForeachLoop` (21%)
* `Ring::Loop.arrayListLoop` (21%)
* `Ring::Euler.problem1bySequence` (20%)
* 34 tests with score degradation achieved 10-20% of change, other tests achieved < 10% degradation 

### *Linux x64*

_Geometric mean:_ 5.34 ± 0.61 % of degradation

_Tests with the most significant score degradation:_
* `Ring::Inheritance.baseCalls` (70%)
* `Ring::Calls.returnBoxUnboxFolding` (50%)
* `Ring::Inline.calculateInline` (50%)
* `Ring::ForLoops.charArrayLoop` (49%)
* `Ring::ForLoops.uIntArrayLoop` (48%)
* `Ring::ForLoops.uShortArrayLoop` (48%)
* `Ring::ForLoops.uLongArrayLoop` (46%)
* `Ring::Fibonacci.calcClassic` (41%)
* `Ring::Fibonacci.calcSquare` (41%)
* `Ring::ForLoops.stringLoop` (32%)
* `Ring::ParameterNotNull.invokeEightArgsWithoutNullCheck` (28%)
* 23 tests with score degradation achieved 10-25% of change, other tests achieved < 10% degradation

## seq-vs-baseline

This is a further research case too: to check how replacing `NotAtomic` accesses with the strongest `SequentiallyConsistent` mode will degrade the performance.

### *MacOS Arm64*

_Geometric mean:_ 57.17 ± 0.09 % of degradation

_Tests with the most significant score degradation:_
* `Ring::Inheritance.baseCalls` (91%)
* `Ring::ArrayCopyBenchmark.copyInSameArray` (90%)
* `Ring::DefaultArgument.testEightOfEight` (87%)
* `Ring::AllocationBenchmark.allocateObjects` (86%)
* `Cinterop::boxedInt` (85%)
* `Ring::ChainableBenchmark.testChainable` (84%)
* `Ring::ParameterNotNull.invokeEightArgsWithoutNullCheck` (83%)
* `Ring::ClassList.countWithLambda` (83%)
* `Ring::ParameterNotNull.invokeEightArgsWithNullCheck` (83%)
* `Ring::BunnymarkBenchmark.testBunnymark` (83%)
* `Ring::CompanionObject.invokeRegularFunction` (80%)
* 127 tests with score degradation achieved 50-80% of change, other tests achieved < 50% degradation

### *Linux x64*

_Geometric mean:_ 6.12 ± 0.61 % % of degradation

_Tests with the most significant score degradation:_
* `Ring::Inheritance.baseCalls` (70%)
* `Ring::Calls.returnBoxUnboxFolding` (50%)
* `Ring::Lambda.mutatingLambda` (49%)
* `Ring::Inline.calculateInline` (49%)
* `Ring::ForLoops.charArrayLoop` (49%)
* `Ring::ForLoops.uShortArrayLoop` (48%)
* `Ring::ForLoops.uIntArrayLoop` (48%)
* `Ring::ForLoops.uLongArrayLoop` (46%)
* `Cinterop::boxedInt` (43%)
* `Ring::Fibonacci.calcSquare` (41%)
* `Ring::Fibonacci.calcClassic` (41%)
* `Ring::BunnymarkBenchmark.testBunnymark` (22%)
* `Ring::ParameterNotNull.invokeTwoArgsWithNullCheck` (22%)
* other tests achieved <= 20% degradation
