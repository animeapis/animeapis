#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

protoc -I /workspace -I /googleapis -I /usr/include/google --graphql_out=/graphql $@

exit 0