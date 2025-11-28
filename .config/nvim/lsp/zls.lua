return {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root = require("config.utils").find_proj_root({ 'zls.json', '.git', })
}
