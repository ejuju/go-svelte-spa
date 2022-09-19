#!/bin/bash

set -e

start=$(date +%s)

./ops/check_code.sh
./ops/build.sh

end=$(date +%s)
runtime=$((end-start))
printf 'Took %s seconds to check code and build container image \n' "$runtime"

./ops/run.sh