#!/usr/bin/env bash
set -e

# usage: ./compileToExeWithBitcode.sh source_file.kt output_exe_directory output_bitcode_directory
# example:
#   ./extractMainBitcode.sh Main.kt output output/bitcode

source_file=$1
output_exe_dir=$2
output_bitcode_dir=$3

if [[ "$source_file" == "" || "$source_file" != *.kt ]]; then
    echo "missing a source_file.kt argument"
    exit 1
fi
if [[ "$output_exe_dir" == "" ]]; then
    echo "missing an output_exe_directory argument"
    exit 1
fi
if [[ "$output_bitcode_dir" == "" ]]; then
    echo "missing an output_bitcode_directory argument"
    exit 1
fi

exe_file=$output_exe_dir/main.kexe
o_file="$output_exe_dir/result.o"
bc_file="$output_exe_dir/main.kt.bc"
ll_file="$output_bitcode_dir/bitcode.ll"
mainfun_ll_file="$output_bitcode_dir/mainfun_bitcode.ll"

search_pattern='define internal fastcc void @"kfun:#main(){}'

echo "Compiling $source_file"
echo

# compile to executable and save temporary files
../../../dist/bin/kotlinc-native "$source_file" -opt -Xtemporary-files-dir="$output_exe_dir" -o "$exe_file"
echo

echo "Preparing its bitcode"
echo

# translate machine .bc bitcode file to readable .ll bitcode file
llvm-dis "$bc_file" -o "$ll_file"
# prepare shorten bitcode version
./extractFunctionCode.py -p "$search_pattern" -i "$ll_file" -o "$mainfun_ll_file"

# clear redundant files
rm -rf "$bc_file" "$o_file"

echo "Compiled $source_file to executable $exe_file and bitcode in $output_bitcode_dir"
echo
