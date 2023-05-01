local indent = 2

-- make keymaps silent by default
local keymap_set = vim.keymap.set
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return keymap_set(mode, lhs, rhs, opts)
end

vim.opt.spell = true
vim.g.mapleader = " "
vim.opt.expandtab = true -- use spaces instead of tab
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.undofile = true
vim.opt.wrap = false -- disable line wrap
vim.opt.shiftwidth = indent -- size of indent
vim.opt.tabstop = indent -- number of spaces for tab
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cino = "N-s,g0,l1"
vim.opt.splitbelow = true -- new windows below current
vim.opt.splitright = true -- new windows right of current
vim.opt.textwidth = 80
vim.opt.updatetime = 200

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

