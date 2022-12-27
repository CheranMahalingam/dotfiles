local M = {
  "akinsho/toggleterm.nvim",

  lazy = false,
}

function M.config()
  require("toggleterm").setup({
    start_in_insert = false,
    direction = "float",
    persist_mode = true,
    persist_size = true,
    auto_scroll = false,
    open_mapping = [[<C-\>]],
    float_opts = {
      border = "single",
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.9),
    },
  })
end

return M

