local M = {}

M.find_proj_root = function(patterns)
  return vim.fs.root(0, patterns)
end

return M
