local auto_session = require("auto-session")
auto_session.setup({
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  pre_save_cmds = { "NvimTreeClose" },
})
