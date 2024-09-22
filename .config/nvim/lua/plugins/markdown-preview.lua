return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  keys = {
    {
      "<leader>mp",
      "<cmd>MarkdownPreviewToggle<CR>",
      desc = "Toggle Browser Markdown Preview",
    },
  },
  config = function()
    vim.cmd([[
      let g:mkdp_theme = "dark"
      let g:mkdp_auto_close = 0
    ]])
  end,
}
