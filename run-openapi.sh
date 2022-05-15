#!/bin/bash

rm -rf output

mkdir -p output/animeshon/credentials/v1alpha1
mkdir -p output/animeshon/crossrefs/v1alpha1
mkdir -p output/animeshon/hub/v1alpha1
mkdir -p output/animeshon/iam/admin/v1alpha1
mkdir -p output/animeshon/identity/v1alpha1
mkdir -p output/animeshon/image/v1alpha1
mkdir -p output/animeshon/knowledge/v1alpha1
mkdir -p output/animeshon/library/v1alpha1
mkdir -p output/animeshon/multimedia/v1alpha1
mkdir -p output/animeshon/product/v1alpha1
mkdir -p output/animeshon/release/v1alpha1
mkdir -p output/animeshon/resourcemanager/v1alpha1
mkdir -p output/animeshon/tracker/v1alpha1
mkdir -p output/animeshon/vision/v1alpha1
mkdir -p output/animeshon/webcache/v1alpha1

# https://github.com/google/gnostic
# TODO: move protoc commands to bazel rules.

protoc animeshon/credentials/v1alpha1/credentials.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/credentials/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Credentials API",version="v1alpha1"

protoc animeshon/crossrefs/v1alpha1/crossrefs.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/crossrefs/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="CrossRefs API",version="v1alpha1"

protoc animeshon/hub/v1alpha1/hub.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/hub/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Hub API",version="v1alpha1"

protoc animeshon/iam/admin/v1alpha1/iam.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/iam/admin/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Identity and Access Management API",version="v1alpha1"

protoc animeshon/identity/v1alpha1/identity.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/identity/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Identity API",version="v1alpha1"

protoc animeshon/image/v1alpha1/image.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/image/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Image API",version="v1alpha1"

protoc animeshon/knowledge/v1alpha1/knowledge.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/knowledge/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Knowledge API",version="v1alpha1"

protoc animeshon/library/v1alpha1/library.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/library/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Library API",version="v1alpha1"

protoc animeshon/multimedia/v1alpha1/anime.proto \
  animeshon/multimedia/v1alpha1/chapter.proto \
  animeshon/multimedia/v1alpha1/common.proto \
  animeshon/multimedia/v1alpha1/episode.proto \
  animeshon/multimedia/v1alpha1/graphic_novel.proto \
  animeshon/multimedia/v1alpha1/light_novel.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/multimedia/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Multimedia API",version="v1alpha1"

protoc animeshon/product/v1alpha1/chapter.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/product/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Product API",version="v1alpha1"

protoc animeshon/release/v1alpha1/release.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/release/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Release API",version="v1alpha1"

protoc animeshon/resourcemanager/v1alpha1/resourcemanager.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/resourcemanager/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Resource Manager API",version="v1alpha1"

protoc animeshon/tracker/v1alpha1/tracker.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/tracker/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Tracker API",version="v1alpha1"

protoc animeshon/vision/v1alpha1/annotations.proto \
  animeshon/vision/v1alpha1/geometry.proto \
  animeshon/vision/v1alpha1/properties.proto \
  animeshon/vision/v1alpha1/vision.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/vision/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="Vision API",version="v1alpha1"

protoc animeshon/webcache/v1alpha1/webcache.proto \
  -I../../googleapis/googleapis \
  -I. \
  --openapi_out=output/animeshon/webcache/v1alpha1 \
  --openapi_opt=fq_schema_naming=true,enum_type=string,title="WebCache API",version="v1alpha1"
