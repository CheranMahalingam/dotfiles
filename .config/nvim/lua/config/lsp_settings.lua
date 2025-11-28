vim.diagnostic.config({
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ✗",
      [vim.diagnostic.severity.WARN] = " ❢",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " 𝓲",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
    },
  },
})

local key_mappings = {
  { "gd", vim.lsp.buf.definition, "Go to definition" },
  { "gD", vim.lsp.buf.declaration, "Buffer declaration" },
  { "gi", vim.lsp.buf.implementation, "Get implementation" },
  { "gr", vim.lsp.buf.references, "Get references" },
  {
    "K",
    function()
      vim.lsp.buf.hover({ border = "rounded" })
    end,
    "Show documentation",
  },
  { "<leader>rn", vim.lsp.buf.rename, "Rename" },
  { "<leader>ca", vim.lsp.buf.code_action, "Code action" },
}
for _, mapping in ipairs(key_mappings) do
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", mapping[1], mapping[2], vim.tbl_extend("force", opts, { desc = mapping[3] }))
end

vim.lsp.enable({
  "bashls",
  "clangd",
  "cmake",
  "gopls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "ts_ls",
  "zls",
})
