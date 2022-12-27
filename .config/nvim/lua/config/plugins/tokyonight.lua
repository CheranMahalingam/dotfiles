local M = {
  "folke/tokyonight.nvim",

  lazy = false,
}

function M.config()
  local tokyonight = require("tokyonight")
  tokyonight.setup({
    style = "night",
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
  tokyonight.load()
end

return M

