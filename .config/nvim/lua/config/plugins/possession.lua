local M = {
  "jedrzejboczar/possession.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  require("possession").setup({
    autosave = {
      current = false,
      tmp = false,
      on_load = false,
      on_quit = false,
    },
    commands = {
      save = 'SSave',
      load = 'SLoad',
      delete = 'SDelete',
    },
    telescope = {
      list = {
        default_action = 'load',
        mappings = {
          delete = { n = '<c-d>', i = '<c-d>' },
          rename = { n = '<c-r>', i = '<c-r>' },
        },
      },
    },
  })
end

function M.init()
  require("telescope").load_extension("possession")
  vim.keymap.set("n", "<C-s>", require("telescope").extensions.possession.list)
end

return M

