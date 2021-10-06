#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

declare -A services=(
  ["crossrefs"]="crossrefs"
  ["grbac"]="grbac"
  ["hub"]="hub"
  ["iam/admin"]="admin"
  ["identity"]="identity"
  ["image"]="image"
  ["knowledge"]="knowledge"
  ["resourcemanager"]="resourcemanager"
  ["tracker"]="tracker"
  ["library"]="library"
  ["vision"]="vision"
  ["webcache"]="webcache"
)

declare -A gapi=(
  ["crossrefs"]="crossrefs"
  ["grbac"]="grbac"
  ["hub"]="hub"
  ["iam/admin"]="iam-admin"
  ["identity"]="identity"
  ["image"]="image"
  ["knowledge"]="knowledge"
  ["resourcemanager"]="resourcemanager"
  ["tracker"]="tracker"
  ["library"]="library"
  ["vision"]="vision"
  ["webcache"]="webcache"
)

for i in "${!services[@]}"
do
  echo $i
  # animeapis/proto-binary
  echo "copying protobuf binaries to animeapis/proto-binary..."

  rm -rf "animeapis/proto-binary/${i}/v1alpha1"
  mkdir -p "animeapis/proto-binary/${i}/v1alpha1"

  cp "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_proto_with_info-set.proto.bin" "animeapis/proto-binary/${i}/v1alpha1/${services[$i]}_with_info.proto.bin"
  cp "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_proto-descriptor-set.proto.bin" "animeapis/proto-binary/${i}/v1alpha1/${services[$i]}.proto.bin"

  # animeapis/api-go-client
  echo "copying gapics to animeapis/api-go-client..."

  rm -rf "animeapis/api-go-client/${i}/v1alpha1"
  mkdir -p "animeapis/api-go-client/${i}/v1alpha1"

  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_gapic_srcjar_metadata.json/github.com/animeapis" .
  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_gapic_srcjar_main.go/github.com/animeapis" .
  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_gapic_srcjar_test.go/github.com/animeapis" .

  # animeapis/api-nodejs-client
  echo "copying gapics to animeapis/api-nodejs-client..."

  WORKDIR="nodejs-generator/${i}"
  mkdir -p "${WORKDIR}"

  if [ -f "animeapis/api-nodejs-client/src/apis/${i}/CHANGELOG.md" ]; then
    mv "animeapis/api-nodejs-client/src/apis/${i}/CHANGELOG.md" "${WORKDIR}/CHANGELOG.md"
  fi

  if [ -f "animeapis/api-nodejs-client/src/apis/${i}/package.json" ]; then
    mv "animeapis/api-nodejs-client/src/apis/${i}/package.json" "${WORKDIR}/package.json"
  fi

  rm -rf "animeapis/api-nodejs-client/src/apis/${i}"
  mkdir -p "animeapis/api-nodejs-client/src/apis/${i}"

  tar -xvf "bazel-bin/animeshon/${i}/v1alpha1/gapi-${gapi[$i]}-v1alpha1-nodejs.tar.gz" -C "animeapis/api-nodejs-client/src/apis/${i}" --strip-components=1

  if [ -f "${WORKDIR}/CHANGELOG.md" ]; then
    mv "${WORKDIR}/CHANGELOG.md" "animeapis/api-nodejs-client/src/apis/${i}/CHANGELOG.md"
  fi

  if [ -f "${WORKDIR}/package.json" ]; then
    mv "${WORKDIR}/package.json" "animeapis/api-nodejs-client/src/apis/${i}/package.json"
  fi

  rm -rf ${WORKDIR}

  # animeapis/go-genproto
  echo "copying *.pb.go files to animeapis/go-genproto..."

  rm -rf "animeapis/go-genproto/${i}/v1alpha1"
  mkdir -p "animeapis/go-genproto/${i}/v1alpha1"

  cp -r "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_proto_/github.com/animeapis" .
done

exit 0