local M = {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
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
  vim.keymap.set("n", "+", api.tree.change_root_to_node, opts("Change Root to Node"))
end

function M.config()
  require("nvim-tree").setup({
    on_attach = on_attach,
    sync_root_with_cwd = true,
    actions = {
      change_dir = {
        global = true
      }
    },
  })
end

function M.init()
  vim.keymap.set("n", "<C-n>", function()
    require("nvim-tree.api").tree.toggle()
  end)
end

return M

