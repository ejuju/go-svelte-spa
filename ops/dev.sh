#!/bin/bash

set -e

./ops/check_code.sh
./ops/build.sh
./ops/run.sh