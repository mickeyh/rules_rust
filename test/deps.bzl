"""A module defining dependencies of the `rules_rust` tests"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//test/load_arbitrary_tool:load_arbitrary_tool_test.bzl", "load_arbitrary_tool_test")

_LIBC_BUILD_FILE_CONTENT = """\
load("@rules_rust//rust:rust.bzl", "rust_library")

rust_library(
    name = "libc",
    srcs = glob(["src/**/*.rs"]),
    visibility = ["//visibility:public"],
)
"""

def rules_rust_test_deps():
    """Load dependencies for rules_rust tests"""

    load_arbitrary_tool_test()

    maybe(
        http_archive,
        name = "libc",
        build_file_content = _LIBC_BUILD_FILE_CONTENT,
        sha256 = "1ac4c2ac6ed5a8fb9020c166bc63316205f1dc78d4b964ad31f4f21eb73f0c6d",
        strip_prefix = "libc-0.2.20",
        urls = [
            "https://mirror.bazel.build/github.com/rust-lang/libc/archive/0.2.20.zip",
            "https://github.com/rust-lang/libc/archive/0.2.20.zip",
        ],
    )
