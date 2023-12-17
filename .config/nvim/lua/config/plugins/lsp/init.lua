local M = {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
    "SmiteshP/nvim-navic"
  },
}

function M.config()
  require("config.plugins.lsp.diagnostics").setup()

  local servers = {
    gopls = {},
    clangd = {},
    cmake = {},
    tsserver = {},
    bashls = {},
    dockerls = {},
    metals = {},
    jsonls = {},
    yamlls = {},
    rust_analyzer = {},
    lua_ls = {},
    pylsp = {},
    marksman = {},
  }

  function on_attach(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Trouble lsp_references<cr>", {})
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
    require("lspconfig")[server].setup(opts)
  end
end

return M

