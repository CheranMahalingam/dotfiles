return {
  "Exafunction/codeium.nvim",
  lazy = false,
  dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
  },
  config = function()
      require("codeium").setup({
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
          -- key_bindings = {
          --   accept = "jk",
          --   clear = "kk",
          -- }
        },
      })
  end
}
