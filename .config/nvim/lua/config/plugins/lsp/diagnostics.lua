local M = {}

function M.setup()
  vim.diagnostic.config({
    virtual_text = false,
  })
end

return M

