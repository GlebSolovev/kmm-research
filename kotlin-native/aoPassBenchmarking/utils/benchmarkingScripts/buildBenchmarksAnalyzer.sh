#!/usr/bin/env bash
set -e

# usage: ./buildBenchmarksAnalyzer.sh

is_mac=$(./validateMachineType.sh)

root_dir="../../../../"

echo "STARTED benchmarksAnalyzer build"
echo

# we want to build analyzer tool using a standard compiler
./runPassBenchmark.sh baseline-build baseline.kt BUILD_ONLY

cd $root_dir
if [ "$is_mac" == true ]; then
    ./gradlew macos_arm64PlatformLibs
    ./gradlew macos_x64PlatformLibs
else
    ./gradlew linux_x64PlatformLibs
fi
cd kotlin-native/tools/benchmarksAnalyzer
../../../gradlew build

echo "FINISHED benchmarksAnalyzer build"
echo
