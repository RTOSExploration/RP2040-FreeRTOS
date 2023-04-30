#!/usr/bin/env bash

#DB=$RTOSExploration/bitcode-db/RP2040-FreeRTOS
#rm -rf $DB build && mkdir -p build
#cmake -S . -B build
#cmake --build build -j$(nproc)

export LLVM_COMPILER=hybrid
export LLVM_COMPILER_PATH=/usr/lib/llvm-14/bin
export GCC_CROSS_COMPILE_PREFIX=arm-none-eabi-
rm -rf build
#CC=wllvm CXX=wllvm++ cmake -S . -B build
cmake -S . -B build -DCMAKE_C_COMPILER=$(which wllvm) -DCMAKE_CXX_COMPILER=$(which wllvm++)
cmake --build build -j$(nproc)
find build/ -name "*.elf" | xargs -n 1 extract-bc
