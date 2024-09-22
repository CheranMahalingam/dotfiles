return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>do",
      "<cmd>DiffviewOpen<CR>",
      desc = "View Diff Against Head",
    },
    {
      "<leader>dc",
      "<cmd>DiffviewClose<CR>",
      desc = "Close Diff",
    },
  },
  config = function()
    require("diffview").setup({})
  end,
}
