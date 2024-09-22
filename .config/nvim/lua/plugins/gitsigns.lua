return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      "<leader>gn",
      "<cmd>Gitsigns next_hunk<CR>",
      desc = "Next Hunk",
    },
    {
      "<leader>gp",
      "<cmd>Gitsigns prev_hunk<CR>",
      desc = "Previous Hunk",
    },
    {
      "<leader>gs",
      mode = { "n", "x" },
      function()
        local mode = vim.api.nvim_get_mode().mode:sub(1,1)
        if mode == 'V' then -- visual-line mode
          local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
           vim.api.nvim_feedkeys(esc, 'x', false) -- exit visual mode
           vim.cmd("'<,'>Gitsigns stage_hunk")
        else
          vim.cmd("Gitsigns stage_hunk")
        end
      end,
      desc = "Stage Hunk",
    },
    {
      "<leader>gS",
      "<cmd>Gitsigns stage_buffer<CR>",
      desc = "Stage Buffer",
    },
    {
      "<leader>gu",
      "<cmd>Gitsigns undo_stage_hunk<CR>",
      desc = "Undo Stage",
    },
    {
      "<leader>gb",
      "<cmd>Gitsigns blame_line full = true<CR>",
      desc = "Blame",
    },
    {
      "<leader>gd",
      "<cmd>Gitsigns toggle_deleted<CR>",
      desc = "Blame",
    },
  },
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
          opts = vim.tbl.extend('force', { noremap = true }, opts or {})
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end
      end,
    })
  end,
}
