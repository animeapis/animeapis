##############################################################################
# Workspace
##############################################################################

workspace(name = "animeapis")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

##############################################################################
# Common
##############################################################################

http_archive(
    name = "com_google_googleapis",
    sha256 = "6cf42ee46b3d7d5b8c30ffc82c0fbce0eaf0738b5bdd9bc58d7134cbf2b8870f",
    strip_prefix = "googleapis-51fe6432d4076a4c101f561967df4bf1f27818e1",
    urls = ["https://github.com/googleapis/googleapis/archive/51fe6432d4076a4c101f561967df4bf1f27818e1.zip"],
)

load("@com_google_googleapis//:repository_rules.bzl", "switched_rules_by_language")

switched_rules_by_language(
    name = "com_google_googleapis_imports",
    gapic = True,
    grpc = True,
    go = True,
)

##############################################################################
# Protocol Buffers (gRPC)
##############################################################################

http_archive(
    name = "com_google_protobuf",
    sha256 = "eaba1dd133ac5167e8b08bc3268b2d33c6e9f2dcb14ec0f97f3d3eed9b395863",
    strip_prefix = "protobuf-3.17.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.17.0.tar.gz"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "rules_proto",
    sha256 = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
    strip_prefix = "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
        "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

##############################################################################
# Golang
##############################################################################

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "69de5c704a05ff37862f7e0f5534d4f479418afc21806c887db544a316f3cb6b",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.27.0/rules_go-v0.27.0.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.27.0/rules_go-v0.27.0.tar.gz",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "62ca106be173579c0a167deb23358fdfe71ffa1e4cfdddf5582af26520f1c66f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.23.0/bazel-gazelle-v0.23.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.23.0/bazel-gazelle-v0.23.0.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.16")

gazelle_dependencies()

##############################################################################
# API Client Generator for Go (GAPIC)
##############################################################################

_gapic_generator_go_version = "0.20.0"

http_archive(
    name = "com_googleapis_gapic_generator_go",
    strip_prefix = "gapic-generator-go-%s" % _gapic_generator_go_version,
    urls = ["https://github.com/googleapis/gapic-generator-go/archive/v%s.tar.gz" % _gapic_generator_go_version],
)

load("@com_googleapis_gapic_generator_go//:repositories.bzl", "com_googleapis_gapic_generator_go_repositories")

com_googleapis_gapic_generator_go_repositories()

load("@com_googleapis_gapic_generator_go//rules_go_gapic:go_gapic_repositories.bzl", "go_gapic_repositories")

go_gapic_repositories()
