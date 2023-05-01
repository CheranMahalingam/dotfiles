local M = {
  "CheranMahalingam/clipboard-image.nvim",
  lazy = false,
}

function M.config()
  require("clipboard-image").setup({
    default = {
      img_dir = "~/vimwiki/assets",
      img_dir_txt = "~/vimwiki/assets",
      affix = "![](%s)",
      img_name = function ()
        vim.fn.inputsave()
        local name = vim.fn.input('Name: ')
        vim.fn.inputrestore()

        if name == nil or name == '' then
          return os.date('%y-%m-%d-%H-%M-%S')
        end
        return name
      end,
      img_handler = function (img)
        vim.cmd("normal! f[")
        vim.cmd("normal! a" .. img.name)
      end,
    },
  })
end

function M.init()
  -- vim.keymap.set("n", "<leader>p", "<cmd>PasteImg<cr>")
end

return M

