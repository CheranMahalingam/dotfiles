vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
vim.g.bigfile_size = 1024 * 1024 * 15. -- 1.5MB

vim.g.trouble_lualine = true

local opt = vim.opt

opt.cino = "N-s,g0,l1"
opt.completeopt = "menu,menuone,noselect"
opt.expandtab = true -- Use spaces instead of tabs
opt.hidden = true
opt.hlsearch = true
opt.mouse = "a" -- Enable mouse mode
opt.number = true
opt.relativenumber = false -- Disable relative line numbering
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.shiftwidth = 2 -- Size of an indent
opt.signcolumn = "yes"
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- new windows below current
opt.splitright = true -- new windows right of current
opt.swapfile = false
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- Enable true color support
opt.undofile = true
opt.undolevels = 10000
opt.wrap = false -- Disable line wrap
