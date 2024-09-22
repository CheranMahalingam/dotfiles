return {
  "nvim-neotest/neotest",
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
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-go"),
        require("neotest-gtest"),
        require("neotest-jest"),
      },
    })
  end,
  keys = {
    {
      "<leader>nn",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest Test",
    },
    {
      "<leader>nf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run All Tests in File",
    },
    {
      "<leader>nd",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug Nearest Test",
    },
    {
      "<leader>ns",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Test Summary Results",
    },
    {
      "<leader>no",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "View Test Output",
    },
  },
}
