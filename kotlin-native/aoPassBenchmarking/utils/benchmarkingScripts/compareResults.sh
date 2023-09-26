#!/usr/bin/env bash
set -e

# usage: ./compareResults.sh target_pass_name baseline_pass_name
# example:
#   ./compareResults.sh unordered baseline

target_pass_name=$1
baseline_pass_name=$2
result_filename="$target_pass_name"-vs-"$baseline_pass_name".html

is_mac=$(./validateMachineType.sh)

root_dir="../../../.."
cd $root_dir/kotlin-native/tools/benchmarksAnalyzer

result_dir="results"
mkdir -p $result_dir

# source benchmark results are expected to be found at kotlin-native/performance/build directory
sources_dir="../../performance/build"

# compile comparison result file into kotlin-native/tools/benchmarksAnalyzer/results directory
machine_dir=""
if [ "$is_mac" == true ]; then
    machine_dir="macosArm64"
else
    machine_dir="linux"
fi
benchmarksAnalyzer="./build/bin/$machine_dir/benchmarksAnalyzerReleaseExecutable/benchmarksAnalyzer.kexe"
$benchmarksAnalyzer $sources_dir/"$target_pass_name".json $sources_dir/"$baseline_pass_name".json -f -r html -o $result_dir/"$result_filename"

echo COMPILED "$result_filename" REPORT
echo
