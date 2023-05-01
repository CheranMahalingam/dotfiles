local M = {
  "folke/trouble.nvim",
  event = "BufReadPre",
}

function M.init()
  vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>")
  vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
  vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>")
  vim.keymap.set("n", "<leader>tf", "<cmd>TroubleToggle quickfix<cr>")
end

return M

