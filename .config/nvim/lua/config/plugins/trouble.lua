local M = {
  "folke/trouble.nvim",
  event = "VeryLazy",
}

function M.init()
  vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
  vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>")
  vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>")
end

return M

