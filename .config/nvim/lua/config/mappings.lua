-- Switch windows with ctrl + navigation key
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Exit mode using jj
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<C-Up>", "<cmd>resize -5<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +5<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>")

vim.keymap.set("n", "<leader>x", "<cmd>bd!<cr>")

vim.keymap.set("n", "<leader>re", "<cmd>:noh<cr>")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope man_pages<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>")
vim.keymap.set("n", "<leader>fgs", "<cmd>Telescope git_status<cr>")
vim.keymap.set("n", "<leader>fgc", "<cmd>Telescope git_commits<cr>")
vim.keymap.set("n", "<leader>fgb", "<cmd>Telescope git_branches<cr>")
vim.keymap.set("n", "<leader>fgh", "<cmd>Telescope git_bcommits<cr>")
vim.keymap.set("n", "<leader>fga", "<cmd>Telescope git_stash<cr>")

vim.keymap.set("t", "jj", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

vim.keymap.set("n", "<leader>tc", function()
    vim.o.background = vim.o.background == "dark" and "light" or "dark"
  end)

