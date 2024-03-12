require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- UI config
vim.cmd [[set hlsearch]]
vim.opt.relativenumber = true
vim.cmd.colorscheme "kanagawa-dragon"
vim.cmd [[
 hi Normal guibg=none ctermbg=none
 hi NormalNC guibg=none ctermbg=none
 hi LineNr guibg=none ctermbg=none
 hi NonText guibg=none ctermbg=none
 hi SignColumn guibg=none ctermbg=none
 hi EndOfBuffer guibg=none ctermbg=none
 hi SignColumn guibg=none ctermbg=none
 hi VertSplit guibg=none ctermbg=none
 hi TbLine guibg=none ctermbg=none
 hi TbLineBufOn guibg=none ctermbg=none
 hi TbLineBufOff guibg=none ctermbg=none
 hi TbLineBufOnClose guibg=none ctermbg=none
 hi TbLineBufOffClose guibg=none ctermbg=none
 hi TbLineFill guibg=none ctermbg=none
]]

-- autocmds
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  command = "wall",
})
