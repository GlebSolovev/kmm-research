#!/usr/bin/env bash
set -e

# usage: ./buildCompiler.sh ["fresh" | "-f"]
# examples:
#   ./buildCompiler.sh fresh
#   ./buildCompiler.sh -f

fresh_build=$1

./validateMachineType.sh -q

root_dir="../../../../"
cd $root_dir

if [ "$fresh_build" == "fresh" ] || [ "$fresh_build" == "-f" ]; then
    echo CLEANING
    ./gradlew clean
    echo CLEANED
    echo
elif [ "$fresh_build" != "" ]; then
    echo "invalid fresh_build argument"
    exit 1
fi
echo BUILDING COMPILER
./gradlew :kotlin-native:bundle
echo COMPILER IS SUCCESSFULLY BUILT
echo
