local M = {
  "williamboman/mason.nvim",
  event = "BufReadPre",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}

function M.config()
  require("mason").setup({})
  require("mason-lspconfig").setup({
    automatic_installation = true,
  })
end

return M

