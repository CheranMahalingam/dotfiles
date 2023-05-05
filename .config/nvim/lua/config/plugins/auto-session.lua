local M = {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    { "nvim-tree/nvim-tree.lua" },
  },
}

function M.config()
  require("auto-session").setup({
    auto_save_enabled = false,
    auto_sessions_use_git_branch = true,

    session_lens = {
    theme_conf = { border = true },
      previewer = true,
    },
  })
end

function M.init()
  vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {noremap = true})
  vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>")
end

return M

