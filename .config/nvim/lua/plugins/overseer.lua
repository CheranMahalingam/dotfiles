return {
  'stevearc/overseer.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "folke/snacks.nvim",
  },
  cmd = {
    "OverseerRun",
    "OverseerToggle",
  },
  keys = {
    {
      "<leader>or",
      "<cmd>OverseerRun<CR>",
      mode = "n",
      desc = "[O]verseer [R]un",
    },
    {
      "<leader>os",
      "<cmd>OverseerShell<CR>",
      mode = "n",
      desc = "[O]verseer [S]hell",
    },
    {
      "<leader>ot",
      "<cmd>OverseerToggle!<CR>",
      mode = "n",
      desc = "[O]verseer [T]oggle",
    },
  },
  ---@module 'overseer'
  ---@type overseer.SetupOpts
  opts = {},
}
