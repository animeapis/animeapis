#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

docker build -t protoc-graphql -f scripts/graphql/Dockerfile .

docker run \
  -v `pwd`/animeshon:/workspace/animeshon \
  -v `pwd`/output-graphql:/graphql \
  protoc-graphql \
  $(find animeshon -iname "*.proto")

exit 0