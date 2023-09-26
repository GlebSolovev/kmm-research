#!/usr/bin/env bash
set -e

# usage: ./validateMachineType.sh ["quiet" | "-q"]
# example:
#   ./validateMachineType.sh quiet
#   ./validateMachineType.sh -q
# in scripts:
#   is_mac=$(./validateMachineType.sh)

quiet=$1

getMachineType() {
    # code is borrowed from https://stackoverflow.com/a/3466183

    unameOut="$(uname -s)"
    case "${unameOut}" in
    Linux*) machine=Linux ;;
    Darwin*) machine=Mac ;;
    CYGWIN*) machine=Cygwin ;;
    MINGW*) machine=MinGw ;;
    MSYS_NT*) machine=Git ;;
    *) machine="UNKNOWN:${unameOut}" ;;
    esac

    echo "$machine"
}

machine=$(getMachineType)
if [ "$machine" == "Mac" ]; then
    is_mac=true
elif [ "$machine" == "Linux" ]; then
    is_mac=false
else
    echo "unsupported machine type: $machine"
    exit 1
fi

if [ "$quiet" == "quiet" ] || [ "$quiet" == "-q" ]; then
    exit 0
elif [ "$quiet" == "" ]; then
    echo "$is_mac"
else
    echo "invalid quiet argument"
    exit 1
fi
