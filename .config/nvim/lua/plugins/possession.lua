return {
  "jedrzejboczar/possession.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<C-s>",
      function()
        require("telescope").load_extension("possession")
        require("telescope").extensions.possession.list()
      end,
      desc = "View Existing Sessions",
    },
  },
  cmd = { 'SSave', 'SLoad', 'SDelete' },
  config = function()
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
      plugins = {
        delete_hidden_buffers = false,
      },
    })
  end,
}
