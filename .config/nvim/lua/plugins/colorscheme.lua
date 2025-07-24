return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "night",
        light_style = "day",
	      styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
        terminal_colors = true,
        on_colors = function(colors)
          colors.bg = "#11121d"
          colors.blue1 = "#f7768e"
          colors.bg_sidebar = "#11121d"
        end,
      })
      require("tokyonight").load()
    end,
  },
}
