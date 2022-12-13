#!/usr/bin/env bash

DB=$RTOSExploration/bitcode-db/RP2040-FreeRTOS
rm -rf $DB build && mkdir -p build
cmake -S . -B build
genbc $DB -c "cmake --build build -j$(nproc)"
