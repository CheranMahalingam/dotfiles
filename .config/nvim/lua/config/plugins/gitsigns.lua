local M = {
  "lewis6991/gitsigns.nvim",
}

function M.config()
  require("gitsigns").setup({
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl.extend('force', { noremap = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end
    end,
  })
end

return M

