-- automatically wrap text when editing markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "mdx" },
  callback = function()
    vim.cmd("set tw=80 wrap")
    vim.opt_local.wrap = true
  end,
})

-- close certain filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "gitsigns.blame",
    "help",
    "lspinfo",
    "neotest-summary",
    "neotest-output",
    "neotest-output-panel",
    "qf", 
    "spectre_panel", 
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- attach autocompletion extension to dap repls
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dap-repl" },
  callback = function()
    require("dap.ext.autocompl").attach()
  end,
})
