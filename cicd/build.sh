#!/bin/bash

start=$(date +%s)

[[ -z "$REPO" ]]; REPO="localhost/go-svelte-spa"
printf 'Using repo: %s \n' "$REPO"

[[ -z "$TAG" ]]; TAG="$(git rev-parse --short HEAD)"
printf 'Using tag: %s \n' "$TAG"

podman build . \
    -f ./containerfile \
    -t "$REPO:$TAG" \
    --progress plain

end=$(date +%s)
runtime=$((end-start))
printf 'Took %s seconds to build container image \n\n' "$runtime"