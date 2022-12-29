local M = {
  "vimwiki/vimwiki",
  lazy = false,
}

function M.init()
  vim.cmd([[
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
  ]])
end

return M

