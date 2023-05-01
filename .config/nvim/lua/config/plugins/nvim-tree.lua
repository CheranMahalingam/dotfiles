local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
}

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<S-Right>", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "<S-Down>", api.node.open.horizontal, opts("Open: Horizontal Split"))
end

function M.config()
  require("nvim-tree").setup({
    on_attach = on_attach,
  })
end

function M.init()
  vim.keymap.set("n", "<C-n>", function()
    require("nvim-tree.api").tree.toggle()
  end)
end

return M

