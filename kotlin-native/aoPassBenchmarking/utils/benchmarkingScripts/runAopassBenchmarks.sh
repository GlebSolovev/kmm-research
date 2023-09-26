#!/usr/bin/env bash
set -e

# usage: ./runAopassBenchmarks.sh run_name [aopass_mode] [attempts_number] [test_task] [filter_tests]
#   where run_name = baseline | unordered | monotonic | seq_const | all_to_not_atomic | all_to_seq_const
# examples:
#   ./runAopassBenchmarks.sh unordered
#   ./runAopassBenchmarks.sh baseline2 baseline
#   ./runAopassBenchmarks.sh 30-attempts baseline 30
#   ./runAopassBenchmarks.sh 30-attempts-cinterop baseline 30 :cinterop:konanRun
#   ./runAopassBenchmarks.sh 30-attempts-int-cinterop baseline 30 :cinterop:konanRun --filter=int,boxedInt
#   ./runAopassBenchmarks.sh 30-attempts-multithreading baseline 30 :ring:konanRun --filterRegex=MultithreadedLoops.*

run_name=$1
aopass_mode=$2
attempts_number=$3
test_task=$4
filter_tests=$5

./validateMachineType.sh -q

if [ -z "$aopass_mode" ]; then
    aopass_mode="$run_name"
fi

case "$aopass_mode" in
    baseline|unordered|monotonic|seq_const|all_to_not_atomic|all_to_seq_const)
        # do nothing, mode is correct
        ;;
    *)
        echo "invalid aopass_mode argument"
        exit 1
esac

run_args=()

if [ "$test_task" != "" ]; then
    run_args+=("$test_task")
    run_args+=(--verbose)
    # "--verbose" provides better progress tracking for separate tasks, but
    # causes additional printing between run iterations, that might potentially impact the results
else
    run_args+=(:konanRun)
fi

run_args+=(-PnativeJson="$run_name".json)

if [ "$attempts_number" != "" ]; then
    run_args+=("-Pattempts=$attempts_number")
fi

if [[ "$filter_tests" == "--filter="* ]] || [[ "$filter_tests" == "--filterRegex="* ]]; then
    run_args+=("$filter_tests")
elif [ "$filter_tests" != "" ]; then
    echo "invalid filter argument"
    exit 1
fi

# current workaround for konanVersion property bug
run_args+=("-PkonanVersion=1.9.0")

# construct args for K/N compiler
compiler_args="-Xaopass-mode=$aopass_mode"
if [ "$aopass_mode" != "baseline" ]; then
    compiler_args="$compiler_args -linker-options=-latomic"
fi
run_args+=("-PcompilerArgs=$compiler_args")

# run benchmarks and save the result into kotlin-native/performance/build directory
echo READY TO RUN "$run_name" BENCHMARKS
echo

root_dir="../../../.."
cd $root_dir/kotlin-native/performance
echo NOW AT: "$(pwd)"
echo

# stop Gradle daemon to increase chances not to get it killed during benchmarking unexpectedly 
../../gradlew -stop
echo

echo RUNNING BENCHMARKS WITH COMMAND: ../../gradlew "${run_args[@]}"
../../gradlew "${run_args[@]}"

echo SUCCESSFULLY FINISHED "$run_name" BENCHMARKS
echo
