#!/bin/bash

[[ -z "$REPO" ]]; REPO="localhost/go-svelte-spa"
printf 'With REPO: %s \n' "$REPO"

[[ -z "$TAG" ]]; TAG="$(git rev-parse --short HEAD)"
printf 'With TAG: %s \n' "$TAG"

[[ -z "$PORT" ]]; PORT="2420"
printf 'With PORT: %s \n' "$PORT"

podman run \
    -p "$PORT":"$PORT" \
    --expose="$PORT" \
    --env PORT="$PORT" \
    localhost/go-svelte-spa:"$TAG"