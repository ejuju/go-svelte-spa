#!/bin/bash

printf 'Running app image: %s \n' "$REPO"

[[ -z "$REPO" ]]; REPO="localhost/go-svelte-spa"
printf 'With REPO: %s \n' "$REPO"

[[ -z "$TAG" ]]; TAG="$(git rev-parse --short HEAD)"
printf 'With TAG: %s \n' "$TAG"

[[ -z "$PORT" ]]; PORT="3420"
printf 'With PORT: %s \n' "$PORT"

podman run \
    -p "$PORT":"$PORT" \
    --expose="$PORT" \
    --env PORT="$PORT" \
    "$REPO:$TAG"