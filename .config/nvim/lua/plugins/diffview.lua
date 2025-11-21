return {
  "sindrets/diffview.nvim",
  lazy = false,
  keys = {
    {
      "<leader>vf",
      "<cmd>DiffviewFileHistory %<CR>",
      desc = "View File History",
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
