local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
}

function M.config()
  require("nvim-tree").setup({
    view = {
      mappings = {
        list = {
          { key = {"<S-Right>"}, action = "vsplit", mode = "n" },
          { key = {"<S-Down>"}, action = "split", mode = "n" },
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
    },
    renderer = {
      highlight_opened_files = "none",
      highlight_git = false,
    },
    respect_buf_cwd = true,
  })
end

function M.init()
  vim.keymap.set("n", "<C-n>", function()
    require("nvim-tree.api").tree.toggle()
  end)
end

return M

