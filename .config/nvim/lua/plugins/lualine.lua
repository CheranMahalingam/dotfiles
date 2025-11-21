return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "folke/tokyonight.nvim",
  },
  lazy = false,
  config = function()
    require('lualine').setup({
      options = {
        theme = 'tokyonight',
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch', 'diagnostics' },
        lualine_c = {},
        lualine_x = { 'overseer' },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'nvim-tree' },
    })
  end
}
