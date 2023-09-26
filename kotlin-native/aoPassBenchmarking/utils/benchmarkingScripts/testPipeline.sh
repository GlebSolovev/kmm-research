#!/usr/bin/env bash
set -e

test() {
    test_name="test"

    # build fresh compiler
    ./buildCompiler.sh -f

    # benchmark baseline compiler on a pair of test
    ./runAopassBenchmarks.sh $test_name baseline 5 :ring:konanRun "--filter=ForLoops.intArrayLoop,ClassList.copy"

    # build analyzer tool
    ./buildBenchmarksAnalyzer.sh

    # compile comparison (the no difference comparison is expected)
    ./compareResults.sh $test_name $test_name
}

echo STARTED TEST BENCHMARKING
echo

test

echo SUCCESSFULLY FINISHED TEST BENCHMARKING
echo
