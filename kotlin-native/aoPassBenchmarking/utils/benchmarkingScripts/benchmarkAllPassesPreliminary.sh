#!/usr/bin/env bash
set -e

# build tooling ones
./buildCompiler -f
./buildBenchmarksAnalyzer.sh

echo STARTED ALL PASSES BENCHMARKING
echo

./runAopassBenchmarks.sh baseline2 baseline
./runAopassBenchmarks.sh baseline3 baseline
# at this point, the environment is highly likely stable
./runAopassBenchmarks.sh unordered
./runAopassBenchmarks.sh monotonic
./runAopassBenchmarks.sh seq seq_const
./runAopassBenchmarks.sh baseline
./runAopassBenchmarks.sh all-to-seq all_to_seq_const
./runAopassBenchmarks.sh all-to-not-atomic all_to_not_atomic

# target comparisons
./compareResults.sh baseline2 baseline
./compareResults.sh baseline3 baseline
./compareResults.sh unordered baseline
./compareResults.sh monotonic baseline
./compareResults.sh seq baseline

# extra comparisons
./compareResults.sh monotonic unordered
./compareResults.sh all-to-seq baseline
./compareResults.sh all-to-not-atomic baseline
./compareResults.sh all-to-seq all-to-not-atomic

echo SUCCESSFULLY FINISHED ALL PASSES BENCHMARKING
echo
