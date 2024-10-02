local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  cmd = { "Mason" },
}

M.tools = {
  -- LSPs
  "clangd",
  "cmake-language-server",
  "elixir-ls",
  "gopls",
  "haskell-language-server",
  "marksman",
  "python-lsp-server",
  "rust-analyzer",
  "typescript-language-server",
  "zls",

  -- Debug Adapters
  "codelldb",
  "delve",

  -- Linters
  "cmakelint",
  "cpplint",
  "eslint_d",
  "flake8",
  "hadolint",
  "mypy",
  "shellcheck",
  "yamllint",

  -- Formatters
  "black",
  "clang-format",
  "isort",
  "prettier",
  "yamlfmt",
}

function M.check()
  local mr = require('mason-registry')
  for _, tool in ipairs(M.tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

function M.config()
  require('mason').setup({})
  M.check()
  require('mason-lspconfig').setup({
    automatic_installation = true,
  })
end

return M
