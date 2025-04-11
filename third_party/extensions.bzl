"""
    Module extension implementation for onnxruntime
"""
load("//third_party:repositories.bzl", "onnxruntime_archive_x86_64", "onnxruntime_archive_aarch64")

def onnxruntime_x86_64_implementation(ctx):
    onnxruntime_archive_x86_64(ctx)

def onnxruntime_aarch64_implementation(ctx):
    onnxruntime_archive_aarch64(ctx)

onnxruntime_x86_64_extension = module_extension(
    implementation = onnxruntime_x86_64_implementation,
)

onnxruntime_aarch64_extension = module_extension(
    implementation = onnxruntime_aarch64_implementation,
)