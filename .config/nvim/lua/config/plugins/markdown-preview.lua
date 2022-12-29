local M = {
  "iamcco/markdown-preview.nvim",
  lazy = false,
}

function M.init()
  vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>")
  vim.cmd([[
    let g:mkdp_theme = "dark"
    let g:mkdp_auto_close = 0
  ]])
end

return M

