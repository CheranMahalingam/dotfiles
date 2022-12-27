local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "cpp",
      "go",
      "python",
      "scala",
      "javascript",
      "typescript",
      "lua",
      "rust",
      "bash",
      "cmake",
      "json",
      "yaml",
    },
    auto_install = false,
    incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = ";",
        node_decremental = ".",
      },
    },
  })
end

return M

