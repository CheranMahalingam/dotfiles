require("config")

require("lazy").setup("plugins")

vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        require('config.keymaps')
    end,
})
