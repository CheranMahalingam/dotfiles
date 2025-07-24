return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/trouble.nvim",
  },
  keys = {
    {
      "<leader>lr",
      "<cmd>LspRestart<CR>",
      desc = "Restart LSP",
    },
    {
      "<leader>ls",
      "<cmd>LspStop<CR>",
      desc = "Stop LSP",
    },
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    require("trouble").setup({})
    local on_attach = function(_, bufnr)
      local map = vim.api.nvim_buf_set_keymap
      local opts = { noremap = true, silent = true }

      map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      map(bufnr, 'n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
      map(bufnr, "n", "gr", "<cmd>Trouble lsp_references<CR>", opts)
      map(bufnr, "n", "gy", "<cmd>Trouble lsp_type_definitions<CR>", opts)
      map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      map(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      map(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    vim.fn.sign_define('DiagnosticSignError', {
        texthl = 'DiagnosticSignError',
        text = ' ✗',
        numhl = 'DiagnosticSignError',
    })
    vim.fn.sign_define('DiagnosticSignWarn', {
        texthl = 'DiagnosticSignWarn',
        text = ' ❢',
        numhl = 'DiagnosticSignWarn',
    })
        vim.fn.sign_define('DiagnosticSignHint', {
        texthl = 'DiagnosticSignHint',
        text = ' ',
        numhl = 'DiagnosticSignHint',
    })
    vim.fn.sign_define('DiagnosticSignInfo', {
        texthl = 'DiagnosticSignInfo',
        text = ' 𝓲',
        numhl = 'DiagnosticSignInfo',
    })
    vim.diagnostic.config({
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      virtual_text = false,
    })

    -- Should match LSPs defined in mason.lua
    local servers = {
      "cmake",
      "gopls",
      "hls",
      "marksman",
      "pylsp",
      "rust_analyzer",
      "ts_ls",
      "zls",
    }
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function()
          return vim.fn.getcwd()
        end,
      })
    end

    nvim_lsp["clangd"].setup({
      init_options = {
        fallbackFlags = {'--std=c++23'}
      },
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = function()
        return vim.fn.getcwd()
      end,
    })
  end,
}
