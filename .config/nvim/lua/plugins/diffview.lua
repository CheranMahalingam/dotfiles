return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>vo",
      "<cmd>DiffviewOpen<CR>",
      desc = "View Diff Against Head",
    },
    {
      "<leader>vc",
      "<cmd>DiffviewClose<CR>",
      desc = "Close Diff",
    },
  },
  config = function()
    require("diffview").setup({})
  end,
}
