local M = {
  "vimwiki/vimwiki",
  lazy = false,

  dependencies = {
    "nvim-telescope/telescope.nvim",
    "ElPiloto/telescope-vimwiki.nvim",
  },
}

function M.init()
  local create_note = function()
    local filename = os.getenv("HOME") .. "/vimwiki/" .. vim.fn.input("Note: ") .. ".md"
    local file = io.open(filename, "w")
    if file ~= nil then
      file:close()
    else
      print("Failed to create note")
    end
  end

  require("telescope").load_extension("vimwiki")
  vim.keymap.set("n", "<leader>vw", require('telescope').extensions.vimwiki.vimwiki)
  vim.keymap.set("n", "<leader>vg", require('telescope').extensions.vw.live_grep)
  vim.keymap.set("n", "<leader>vn", create_note)

  vim.cmd([[
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
  ]])
end

return M

