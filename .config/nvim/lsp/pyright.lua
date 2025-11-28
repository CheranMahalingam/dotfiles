return {
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = require("config.utils").find_proj_root({ ".git", "requirements.txt" }),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  }
}
