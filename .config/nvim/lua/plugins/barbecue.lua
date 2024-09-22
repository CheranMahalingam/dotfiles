return {
  "utilyre/barbecue.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    require("barbecue").setup()
  end
}
