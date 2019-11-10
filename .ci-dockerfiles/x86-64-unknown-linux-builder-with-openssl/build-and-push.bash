#!/bin/bash

set -o errexit
set -o nounset

#
# *** You should already be logged in to DockerHub when you run this ***
#

DOCKERFILE_DIR="$(dirname "$0")"

# built from x86-64-unknown-linux-builder release tag
FROM_TAG=release
TAG_AS=release
docker build --build-arg FROM_TAG="${FROM_TAG}" \
  -t ponylang/net-ssl-ci-x86-64-unknown-linux-builder-with-openssl:"${TAG_AS}" \
  "${DOCKERFILE_DIR}"
docker push ponylang/net-ssl-ci-x86-64-unknown-linux-builder-with-openssl:"${TAG_AS}"

# built from x86-64-unknown-linux-builder latest tag
FROM_TAG=latest
TAG_AS=latest
docker build --build-arg FROM_TAG="${FROM_TAG}" \
  -t ponylang/net-ssl-ci-x86-64-unknown-linux-builder-with-openssl:"${TAG_AS}" \
  "${DOCKERFILE_DIR}"
docker push ponylang/net-ssl-ci-x86-64-unknown-linux-builder-with-openssl:"${TAG_AS}"
