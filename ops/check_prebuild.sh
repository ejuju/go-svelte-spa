#!/bin/bash

go mod tidy && go mod verify ./...
go vet ./...
go test ./... \
    -race \
    -timeout=60s

cd website && npm run check