#!/bin/bash

set -e

printf "Checking backend codebase... \n"
go mod tidy
go mod verify
go vet ./...
CGO_ENABLED=1 go test ./... \
    -race \
    -timeout=60s

printf "Checking website codebase... \n"
cd website
npm run check