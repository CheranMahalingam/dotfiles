return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "isort", "black" },
        go = { "gofmt" },
        cpp = { "clang-format" },
        rust = { "rustfmt" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })

    vim.keymap.set("", "<leader>cf", function()
      require("conform").format({ async = true }, function(err)
        if not err then
          local mode = vim.api.nvim_get_mode().mode
          if vim.startswith(string.lower(mode), "v") then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
          end
        end
      end)
    end, { desc = "Format code" })
  end,
}
