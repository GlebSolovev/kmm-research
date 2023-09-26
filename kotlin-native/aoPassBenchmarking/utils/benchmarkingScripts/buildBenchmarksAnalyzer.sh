#!/usr/bin/env bash
set -e

# usage: ./buildBenchmarksAnalyzer.sh

is_mac=$(./validateMachineType.sh)

echo PREPARING TO BUILD BENCHMARKS-ANALYZER

# compiler should be built (it may be already)
./buildCompiler.sh

# build necessary libs (most likely, they are already built due to `:bundle` build above)
root_dir="../../../../"
cd $root_dir
if [ "$is_mac" == true ]; then
    ./gradlew macos_arm64PlatformLibs
    ./gradlew macos_x64PlatformLibs
else
    ./gradlew linux_x64PlatformLibs
fi
echo

echo BUILDING BENCHMARKS-ANALYZER
cd kotlin-native/tools/benchmarksAnalyzer
../../../gradlew build
echo BENCHMARKS-ANALYZER IS SUCCESSFULLY BUILT
echo
