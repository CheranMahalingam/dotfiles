return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--log=verbose",
    "--std=c++23",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
}
