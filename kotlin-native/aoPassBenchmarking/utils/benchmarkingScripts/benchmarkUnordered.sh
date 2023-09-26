#!/usr/bin/env bash
set -e

measureUnordered() {
    index=$1
    baseline_name="x2-size-30-attempts-baseline-${index}"
    unordered_name="x2-size-30-attempts-unordered-${index}"

    echo STARTED BASELINE-VS-UNORDERED ITERATION \#"$index"

    # run compiler configurations
    ./runAopassBenchmarks.sh "$baseline_name" "baseline" "30"
    ./runAopassBenchmarks.sh "$unordered_name" "unordered" "30"

    # compile comparison
    ./compareResults.sh "$unordered_name" "$baseline_name"

    echo FINISHED ITERATION \#"$index"
}

# build tooling ones
./buildCompiler -f
./buildBenchmarksAnalyzer.sh

echo STARTED BASELINE-VS-UNORDERED BENCHMARKING
echo

for i in {1..20}; do
    measureUnordered "$i"
done

echo SUCCESSFULLY FINISHED BASELINE-VS-UNORDERED BENCHMARKING
echo
