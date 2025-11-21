return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    enabled = true,
    auto_save = true,
    auto_restore = true,
    auto_create = false,
    auto_restore_last_session = false,

    git_use_branch_name = true,
    git_auto_restore_on_branch_change = true,

    supressed_dirs = { "~/", "~/Downloads", "/" },
  },
}
