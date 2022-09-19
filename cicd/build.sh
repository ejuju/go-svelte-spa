#!/bin/bash

[[ -z "$REPO" ]]; REPO="localhost/go-svelte-spa"
printf 'Using repo: %s \n' "$REPO"

[[ -z "$TAG" ]]; TAG="$(git rev-parse --short HEAD)"
printf 'Using tag: %s \n' "$TAG"

podman build . \
    -f ./containerfile \
    -t "$REPO:$TAG" \
    --progress plain

