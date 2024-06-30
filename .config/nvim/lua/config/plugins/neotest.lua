local M = {
  "nvim-neotest/neotest",
  lazy = false,
  dependencies = {
    {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-jest",
      "alfaix/neotest-gtest",
    },
  },
}

function M.config()
  require("neotest").setup({
    adapters = {
      require("neotest-go"),
      require("neotest-gtest"),
      require("neotest-jest"),
    },
  })
end

function M.init()
  vim.keymap.set("n", "<leader>nn", function()
    require("neotest").run.run()
  end)
  vim.keymap.set("n", "<leader>nd", function()
    require("neotest").run.run({strategy = "dap"})
  end)
  vim.keymap.set("n", "<leader>nf", function()
    require("neotest").run.run(vim.fn.expand("%"))
  end)
  vim.keymap.set("n", "<leader>ns", function()
    require("neotest").summary.toggle()
  end)
  vim.keymap.set("n", "<leader>no", function()
    require("neotest").output.open({enter = true})
  end)
end

return M
