local M = {}

M.icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

function M.cmp_format()
  return function(_entry, vim_item)
    if M.icons[vim_item.kind] then
      vim_item.kind = M.icons[vim_item.kind] .. vim_item.kind
    end
    return vim_item
  end
end

return M

