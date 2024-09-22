return {
  "folke/trouble.nvim",
  lazy = false,
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble toggle<cr>",
      desc = "Toggle Window (Trouble)",
    },
    {
      "<leader>tw",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Workspace Diagnostics (Trouble)",
    },
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=false<cr>",
      desc = "LSP Definitions/Reference/etc. (Trouble)",
    },
  },
}
