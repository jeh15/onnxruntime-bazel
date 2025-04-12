"""
    Fetch HTTP archive of precompiled onnxruntime release.
"""
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# TODO(jeh15): Figure out how to pass in version to fetch
def onnxruntime_archive_x86_64(ctx):
    """
    
    Fetch HTTP archive of precompiled onnxruntime release for x86_64.

    Args:
        ctx: Not used.
    
    """
    version = "1.21.0"
    version_name = version.replace(".", "_")
    cpu_platform = "linux-x64"
    url = "https://github.com/microsoft/onnxruntime/releases/download/v{version}/onnxruntime-{cpu_platform}-{version}.tgz".format(version=version, cpu_platform=cpu_platform)
    build_file_content = """
load("@rules_cc//cc:defs.bzl", "cc_import", "cc_library")
hdrs = glob([
    "include/*.h",
    "include/**/*.h",
])
cc_import(
    name = "onnxruntime_lib_import",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime.so",
)
cc_import(
    name = "onnxruntime_lib_import_{version_name}",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime.so.{version}",
)
cc_import(
    name = "onnxruntime_lib_import_1",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime.so.1",
)
cc_import(
    name = "onnxruntime_lib_import_providers_shared",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime_providers_shared.so",
)
cc_library(
    name = "onnxruntime_lib_{cpu_platform}",
    hdrs = hdrs,
    includes = ["include"],
    copts = ["-fPIC"],
    deps = [
        ":onnxruntime_lib_import",
        ":onnxruntime_lib_import_{version_name}",
        ":onnxruntime_lib_import_1",
        ":onnxruntime_lib_import_providers_shared",
    ],
    visibility = ["//visibility:public"],
)
""".format(version=version, version_name=version_name, cpu_platform=cpu_platform)

    http_archive(
        name = "archive_onnxruntime_x86_64",
        build_file_content = build_file_content,
        strip_prefix = "onnxruntime-{cpu_platform}-{version}".format(version=version, cpu_platform=cpu_platform),
        url = url,
        integrity = "sha256-dIXH56rGUBsn41PcvgaORcYatR+69ZjROXDfrmadIL8=",
    )

def onnxruntime_archive_aarch64(ctx):
    """

    Fetch HTTP archive of precompiled onnxruntime release for aarch64.

    Args:
        ctx: Not used.
    
    """
    version = "1.21.0"
    version_name = version.replace(".", "_")
    cpu_platform = "linux-aarch64"
    url = "https://github.com/microsoft/onnxruntime/releases/download/v{version}/onnxruntime-{cpu_platform}-{version}.tgz".format(version=version, cpu_platform=cpu_platform)
    build_file_content = """
load("@rules_cc//cc:defs.bzl", "cc_import", "cc_library")
hdrs = glob([
    "include/*.h",
    "include/**/*.h",
])
cc_import(
    name = "onnxruntime_lib_import",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime.so",
)
cc_import(
    name = "onnxruntime_lib_import_{version_name}",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime.so.{version}",
)
cc_import(
    name = "onnxruntime_lib_import_1",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime.so.1",
)
cc_import(
    name = "onnxruntime_lib_import_providers_shared",
    hdrs = hdrs,
    includes = ["include"],
    shared_library = "lib/libonnxruntime_providers_shared.so",
)
cc_library(
    name = "onnxruntime_lib_{cpu_platform}",
    hdrs = hdrs,
    includes = ["include"],
    copts = ["-fPIC"],
    deps = [
        ":onnxruntime_lib_import",
        ":onnxruntime_lib_import_{version_name}",
        ":onnxruntime_lib_import_1",
        ":onnxruntime_lib_import_providers_shared",
    ],
    visibility = ["//visibility:public"],
)
""".format(version=version, version_name=version_name, cpu_platform=cpu_platform)

    http_archive(
        name = "archive_onnxruntime_aarch64",
        build_file_content = build_file_content,
        strip_prefix = "onnxruntime-{cpu_platform}-{version}".format(version=version, cpu_platform=cpu_platform),
        url = url,
        integrity = "sha256-RQgIS94SMu4atLb60hVb4OosyrHBqumRDds/topggF4=",
    )