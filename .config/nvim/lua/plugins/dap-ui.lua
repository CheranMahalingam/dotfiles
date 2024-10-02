return {
  "rcarriga/nvim-dap-ui",
  lazy = false,
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("dapui").setup({
      force_buffers = false,
      layouts = {
        {
          elements = {
            "scopes",
            "stacks",
            "console",
          },
          size = 0.35,
          position = "right",
        },
        {
          elements = { "repl" },
          size = 0.35,
          position = "bottom",
        }
      },
      render = {
        max_value_lines = 3,
      },
    })
  end,
}
