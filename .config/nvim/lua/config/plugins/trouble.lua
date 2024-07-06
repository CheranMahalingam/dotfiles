local M = {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble toggle<cr>",
    },
    {
      "<leader>tw",
      "<cmd>Trouble diagnostics toggle<cr>",
    },
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=false<cr>",
    },
  },
}

return M

