local M = {
  "nvim-treesitter/nvim-treesitter-textobjects",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = "BufReadPre",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@parameter.inner'] = 'v',
          ['@function.outer'] = 'V', -- linewise
          ['@function.inner'] = 'V',
          ['@class.outer'] = 'V',
          ['@class.inner'] = 'V',
          ['@conditional.outer'] = 'V',
          ['@conditional.inner'] = 'V',
        },
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        floating_preview_opts = {},
        peek_definition_code = {
          ["<leader>pf"] = "@function.outer",
          ["<leader>pc"] = "@class.outer",
        },
      },
    },
  })
end

return M

