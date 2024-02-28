local options = require("plugins.configs.nvimtree")
options.git.enable = true
options.renderer.highlight_git = true
options.renderer.icons.show.git = true
options.filters.git_ignored = false

return options
