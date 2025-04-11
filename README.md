# onnxruntime-bazel
This repository is a bazel module that targets the Linux CPU prebuilt binaries and exports them as a `cc_library`.

This repository targets onnxruntime v1.21.0

## Usage
Add the following to your `MODULE` file:

```python
bazel_dep(name = "onnxruntime-bazel")
archive_override(
    module_name = "onnxruntime-bazel",
    strip_prefix = "onnxruntime-bazel-main",
    urls = ["https://github.com/jeh15/onnxruntime-bazel/archive/refs/heads/main.zip"],
)
```

The dependency target is:
```python
"@onnxruntime-bazel//:onnxruntime"
```
