local util = require("util")
local require = util.require

require("config.options")
require("config.lazy")
 
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.commands")
    require("config.mappings")
  end,
})

