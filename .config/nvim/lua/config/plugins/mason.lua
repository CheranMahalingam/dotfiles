local M = {
  "williamboman/mason.nvim",

  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}

function M.config()
  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {
      "gopls", "pyright", "clangd", "cmake", "tsserver", "bashls",
      "dockerls", "jsonls", "yamlls", "rust_analyzer", "lua_ls"
    },
  })
end

return M

