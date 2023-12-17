local M = {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function() vim.fn["mkdp#util#install"]() end,
}

function M.init()
  vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>")
  vim.cmd([[
    let g:mkdp_theme = "dark"
    let g:mkdp_auto_close = 0
  ]])
end

return M

