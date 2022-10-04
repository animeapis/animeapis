""" TODO """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

# TODO: find a better resting place for the following plugins (e.g. github releases).

def rules_toolchains(**kwargs):
  http_file(
    name = "protoc_gen_graphql",
    sha256 = "ea6ca1bdbfc71863103f7b2f989917a4f84698ae59347329319c31ba097af40f",
    urls = ["https://github.com/animeapis/protoc-gen-graphql/releases/download/v0.0.1/protoc-gen-graphql-linux-amd64"],
    executable = True,
  )

  http_file(
    name = "protoc_gen_openapi",
    sha256 = "90d0005d1514c9e6b2d51e51adb23909346fc288bc5e1dad08e6d515bc8a3ba7",
    urls = ["https://storage.googleapis.com/animeapis-bazel-build-binaries/google/gnostic/v0.6.9/protoc-gen-openapi-linux-amd64"],
    executable = True,
  )
