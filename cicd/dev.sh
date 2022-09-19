#!/bin/bash

set -e

start=$(date +%s)

./cicd/check_code.sh
./cicd/build.sh

end=$(date +%s)
runtime=$((end-start))
printf 'Took %s seconds to check code and build container image \n' "$runtime"

./cicd/run.sh