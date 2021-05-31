#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

declare -a services=(
  "grbac"
  "hub"
  "crossrefs"
  # "knowledge"
  # "vision"
)

for i in "${services[@]}"
do
  # animeapis/proto-binary
  echo "copying protobuf binaries to animeapis/proto-binary..."

  rm -rf "animeapis/proto-binary/${i}/v1alpha1"
  mkdir -p "animeapis/proto-binary/${i}/v1alpha1"

  cp "bazel-bin/animeshon/${i}/v1alpha1/${i}_proto_with_info-set.proto.bin" "animeapis/proto-binary/${i}/v1alpha1/${i}_with_info.proto.bin"
  cp "bazel-bin/animeshon/${i}/v1alpha1/${i}_proto-descriptor-set.proto.bin" "animeapis/proto-binary/${i}/v1alpha1/${i}.proto.bin"

  # animeapis/api-go-client
  echo "copying gapics to animeapis/api-go-client..."

  rm -rf "animeapis/api-go-client/${i}/v1alpha1"
  mkdir -p "animeapis/api-go-client/${i}/v1alpha1"

  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${i}_go_gapic_srcjar_metadata.json/github.com/animeapis" .
  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${i}_go_gapic_srcjar_main.go/github.com/animeapis" .
  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${i}_go_gapic_srcjar_test.go/github.com/animeapis" .

  # animeapis/go-genproto
  echo "copying *.pb.go files to animeapis/go-genproto..."

  rm -rf "animeapis/go-genproto/${i}/v1alpha1"
  mkdir -p "animeapis/go-genproto/${i}/v1alpha1"

  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${i}_go_proto_/github.com/animeapis" .
done

exit 0