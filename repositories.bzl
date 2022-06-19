""" TODO """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

# TODO: find a better resting place for the following plugins (e.g. github releases).

def rules_toolchains(**kwargs):
  http_file(
    name = "protoc_gen_graphql",
    urls = ["https://storage.googleapis.com/animeapis-bazel-build-binaries/opendoor-labs/protoc-gen-graphql/7b4f2fe/protoc-gen-graphql-linux-amd64"],
    executable = True,
  )

  http_file(
    name = "protoc_gen_openapi",
    urls = ["https://storage.googleapis.com/animeapis-bazel-build-binaries/google/gnostic/v0.6.9/protoc-gen-openapi-linux-amd64"],
    executable = True,
  )
