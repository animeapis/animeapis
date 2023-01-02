##############################################################################
# Workspace
##############################################################################

workspace(
    name = "com_animeshon_animeapis",
    # This tells Bazel that the node_modules directory is special and
    # is managed by the package manager.
    # https://bazelbuild.github.io/rules_nodejs/install.html
    managed_directories = {"@npm": ["@gapic_generator_typescript//:node_modules"]},
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

##############################################################################
# Common
##############################################################################

http_archive(
    name = "com_google_googleapis",
    sha256 = "968058a4c4b4f18d1d5716321c847e108be0f74c6fc570f1b3dcd8b110eaef1b",
    strip_prefix = "googleapis-1a54b1fa9b194bfef22de18592a6512e51c9afe2",
    urls = ["https://github.com/googleapis/googleapis/archive/1a54b1fa9b194bfef22de18592a6512e51c9afe2.zip"],
)

load("@com_google_googleapis//:repository_rules.bzl", "switched_rules_by_language")

switched_rules_by_language(
    name = "com_google_googleapis_imports",
    gapic = True,
    go = True,
    grpc = True,
    nodejs = True,
)

##############################################################################
# Protocol Buffers (gRPC)
##############################################################################

http_archive(
    name = "com_google_protobuf",
    sha256 = "ce2fbea3c78147a41b2a922485d283137845303e5e1b6cbd7ece94b96ade7031",
    strip_prefix = "protobuf-3.21.7",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.21.7.tar.gz"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# -----
# TODO: begin experimental block.
# -----
http_archive(
    name = "rules_proto_grpc",
    sha256 = "507e38c8d95c7efa4f3b1c0595a8e8f139c885cb41a76cab7e20e4e67ae87731",
    strip_prefix = "rules_proto_grpc-4.1.1",
    urls = ["https://github.com/rules-proto-grpc/rules_proto_grpc/archive/4.1.1.tar.gz"],
)

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains", "rules_proto_grpc_repos")

rules_proto_grpc_toolchains()

rules_proto_grpc_repos()

load("@rules_proto_grpc//doc:repositories.bzl", rules_proto_grpc_doc_repos = "doc_repos")

rules_proto_grpc_doc_repos()

load("//:repositories.bzl", "rules_toolchains")

rules_toolchains()

# -----
# TODO: end experimental block.
# -----

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

_io_bazel_rules_go_version = "0.33.0"

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "685052b498b6ddfe562ca7a97736741d87916fe536623afb7da2824c0211c369",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v{0}/rules_go-v{0}.zip".format(_io_bazel_rules_go_version),
        "https://github.com/bazelbuild/rules_go/releases/download/v{0}/rules_go-v{0}.zip".format(_io_bazel_rules_go_version),
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.16")

##############################################################################
# GAPIC Generator Bazel Integration
##############################################################################

_rules_gapic_version = "0.19.2"

_rules_gapic_sha256 = "8eff349ac8c3e306db603c8e00ac6d30c59138bb65cabf0f69bf79d23905eec4"

http_archive(
    name = "rules_gapic",
    sha256 = _rules_gapic_sha256,
    strip_prefix = "rules_gapic-%s" % _rules_gapic_version,
    urls = ["https://github.com/googleapis/rules_gapic/archive/v%s.tar.gz" % _rules_gapic_version],
)

load("@rules_gapic//:repositories.bzl", "rules_gapic_repositories")

rules_gapic_repositories()

##############################################################################
# API Client Generator for Go (GAPIC)
##############################################################################

load("@bazel_gazelle//:deps.bzl", "go_repository", "gazelle_dependencies")

go_repository(
  name = "com_google_cloud_go_longrunning",
  importpath = "cloud.google.com/go/longrunning",
  sum = "h1:y50CXG4j0+qvEukslYFBCrzaXX0qpFbBzc3PchSu/LE=",
  version = "v0.1.1",
)

_gapic_generator_go_version = "0.33.5"

_gapic_generator_go_sha256 = "0f16122657c94b23bd5f4dd0e488f7d896a3fd7553da4d34885fa8de1f78d5a8"

http_archive(
    name = "com_googleapis_gapic_generator_go",
    repo_mapping = {
        "@go_googleapis": "@com_google_googleapis",
    },
    sha256 = _gapic_generator_go_sha256,
    strip_prefix = "gapic-generator-go-%s" % _gapic_generator_go_version,
    urls = ["https://github.com/googleapis/gapic-generator-go/archive/v%s.tar.gz" % _gapic_generator_go_version],
)

load("@com_googleapis_gapic_generator_go//:repositories.bzl", "com_googleapis_gapic_generator_go_repositories")

com_googleapis_gapic_generator_go_repositories()

gazelle_dependencies()

##############################################################################
# API Client Generator for TypeScript (GAPIC)
##############################################################################

_gapic_generator_typescript_version = "2.18.2"

_gapic_generator_typescript_sha256 = "45dfd7f059f45f83352a2d9438c1ed021817d9c894220cbd9578b1580194b937"

### TypeScript generator
http_archive(
    name = "gapic_generator_typescript",
    sha256 = _gapic_generator_typescript_sha256,
    strip_prefix = "gapic-generator-typescript-%s" % _gapic_generator_typescript_version,
    urls = ["https://github.com/googleapis/gapic-generator-typescript/archive/v%s.tar.gz" % _gapic_generator_typescript_version],
)

load("@gapic_generator_typescript//:repositories.bzl", "gapic_generator_typescript_repositories")

gapic_generator_typescript_repositories()

load("@build_bazel_rules_nodejs//:index.bzl", "node_repositories", "yarn_install")

node_repositories(
    package_json = ["@gapic_generator_typescript//:package.json"],
)

yarn_install(
    name = "npm",
    package_json = "@gapic_generator_typescript//:package.json",
    yarn_lock = "@gapic_generator_typescript//:yarn.lock",
)
