local M = {
  "L3MON4D3/LuaSnip",

  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}

function M.config()
  local luasnip = require("luasnip")
  luasnip.config.setup({})
end

return M

