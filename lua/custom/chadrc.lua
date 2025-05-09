---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'monochrome',
  telescope = { style = "bordered" },
  statusline = {
    theme = "minimal"
  }
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
