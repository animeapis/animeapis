#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

declare -A services=(
  ["credentials"]="credentials"
  ["crossrefs"]="crossrefs"
  ["graph"]="graph"
  ["grbac"]="grbac"
  ["hub"]="hub"
  ["iam/admin"]="admin"
  ["identity"]="identity"
  ["image"]="image"
  ["knowledge"]="knowledge"
  ["library"]="library"
  ["multimedia"]="multimedia"
  ["product"]="product"
  ["release"]="release"
  ["resourcemanager"]="resourcemanager"
  ["tracker"]="tracker"
  ["vision"]="vision"
  ["webcache"]="webcache"
  ["webpage"]="webpage"
)

declare -A gapi=(
  ["credentials"]="credentials"
  ["crossrefs"]="crossrefs"
  ["graph"]="graph"
  ["grbac"]="grbac"
  ["hub"]="hub"
  ["iam/admin"]="iam-admin"
  ["identity"]="identity"
  ["image"]="image"
  ["knowledge"]="knowledge"
  ["library"]="library"
  ["multimedia"]="multimedia"
  ["product"]="product"
  ["release"]="release"
  ["resourcemanager"]="resourcemanager"
  ["tracker"]="tracker"
  ["vision"]="vision"
  ["webcache"]="webcache"
  ["webpage"]="webpage"
)

declare -A package=(
  ["credentials"]="animeshon.credentials.v1alpha1"
  ["crossrefs"]="animeshon.crossrefs.v1alpha1"
  ["graph"]="animeshon.graph.v1alpha1"
  ["grbac"]="animeshon.grbac.v1alpha1"
  ["hub"]="animeshon.hub.v1alpha1"
  ["iam/admin"]="animeshon.iam.admin.v1alpha1"
  ["identity"]="animeshon.identity.v1alpha1"
  ["image"]="animeshon.image.v1alpha1"
  ["knowledge"]="animeshon.knowledge.v1alpha1"
  ["library"]="animeshon.library.v1alpha1"
  ["multimedia"]="animeshon.multimedia.v1alpha1"
  ["product"]="animeshon.product.v1alpha1"
  ["release"]="animeshon.release.v1alpha1"
  ["resourcemanager"]="animeshon.resourcemanager.v1alpha1"
  ["tracker"]="animeshon.tracker.v1alpha1"
  ["vision"]="animeshon.vision.v1alpha1"
  ["webcache"]="animeshon.webcache.v1alpha1"
  ["webpage"]="animeshon.webpage.v1alpha1"
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

  cp -r -L "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_gapic_srcjar_metadata.json/github.com/animeapis" .
  cp -r -L "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_gapic_srcjar_main.go/github.com/animeapis" .
  cp -r -L "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_gapic_srcjar_test.go/github.com/animeapis" .

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

  cp -r -L "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_go_proto_/github.com/animeapis" .

  # animeapis/openapi-specification
  echo "copying *.yaml files to animeapis/openapi-specification..."

  rm -rf "animeapis/openapi-specification/animeshon/${i}/v1alpha1"
  mkdir -p "animeapis/openapi-specification/animeshon/${i}/v1alpha1"

  cp "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_proto_openapi/openapi.yaml" "animeapis/openapi-specification/animeshon/${i}/v1alpha1"

  # animeapis/graphql-schema
  echo "copying *.graphql files to animeapis/graphql-schema..."

  rm -rf "animeapis/graphql-schema/animeshon/${i}/v1alpha1"
  mkdir -p "animeapis/graphql-schema/animeshon/${i}/v1alpha1"
  cp -r -L "bazel-bin/animeshon/${i}/v1alpha1/${services[$i]}_proto_graphql/animeshon" "animeapis/graphql-schema"

  # animeapis/reference-markdown
  echo "copying *.md files to animeapis/reference-markdown..."

  rm -rf "animeapis/reference-markdown/rpc/animeshon/${i}"
  mkdir -p "animeapis/reference-markdown/rpc/animeshon/${i}"
  cp "bazel-bin/animeshon/${i}/v1alpha1/package.md/package.md" "animeapis/reference-markdown/rpc/animeshon/${i}/${package[$i]}.md"
done

exit 0