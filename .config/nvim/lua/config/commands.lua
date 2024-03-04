vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "dap-repl" },
  callback = function()
    require("dap.ext.autocompl").attach()
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "dap-float" },
  callback = function()
    vim.cmd("nnoremap <buffer><silent> j <cmd>close!<cr>")
    vim.cmd("nnoremap <buffer><silent> k <cmd>close!<cr>")
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.cmd(
      [[if line("'\'") > 0 && line("'\'") <= line("$") | exe "normal! g'\"" | endif]]
    )
  end,
})

vim.cmd("au TextYankPost * lua vim.highlight.on_yank {}")

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "mdx" },
  callback = function()
    vim.cmd("set tw=100 wrap")
  end,
})

