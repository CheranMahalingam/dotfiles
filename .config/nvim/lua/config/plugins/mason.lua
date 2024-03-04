local M = {
  "williamboman/mason.nvim",

  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}

function M.config()
  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {},
    automatic_installation = false,
  })
end

return M

