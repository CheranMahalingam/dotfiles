local M = {
  "utilyre/barbecue.nvim",

  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  event = "BufReadPre",
}

function M.config()
  require("barbecue").setup({
    create_autocmd = false,
  })

  vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include these if you have set `show_modified` to `true`
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
end

return M

