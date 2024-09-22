return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "cuda",
          "dockerfile",
          "elixir",
          "fish",
          "go",
          "haskell",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "python",
          "rust",
          "scala",
          "sql",
          "tsx",
          "typescript",
          "yaml",
          "zig",
        },
        auto_install = false,
        sync_install = false,
        highlight = { enable = true },
      })
    end,
  },
}

