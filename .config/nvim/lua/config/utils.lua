local M = {}

M.find_proj_root = function(patterns)
  return vim.fs.root(0, patterns)
end

M.toggle_qflist = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end

  if qf_exists then
    vim.cmd("cclose")
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

return M
