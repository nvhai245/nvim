local auto_session = require("auto-session")
local function open_nvim_tree()
  require("nvim-tree.api").tree.toggle({ focus = false })
  vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
  vim.cmd [[hi NvimTreeNormalNC guibg=NONE ctermbg=NONE]]
end
local function close_nvim_tree()
  require("nvim-tree.api").tree.close()
end
auto_session.setup({
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  pre_save_cmds = { close_nvim_tree },
  post_restore_cmds = { open_nvim_tree },
})
