#!/bin/bash

set -e

start=$(date +%s)

printf "Checking backend codebase... \n"
go mod tidy
go mod verify
go vet ./...
CGO_ENABLED=1 go test ./... \
    -race \
    -timeout=60s
printf "\n"

printf "Checking website codebase... \n"
cd website
npm run check
printf "\n"

end=$(date +%s)
runtime=$((end-start))
printf 'Took %s seconds to check backend and website code \n\n' "$runtime"