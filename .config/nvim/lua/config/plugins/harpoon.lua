local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
}

function M.init()
  local harpoon = require("harpoon")
  harpoon:setup()

  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
          results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    }):find()
  end

  vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
  vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)
  vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end)

  vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
end

return M