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

vim.api.nvim_create_autocmd("BufLeave", {
  command = "wa",
})

vim.cmd [[set hlsearch]]
vim.cmd [[NvimTreeOpen]]
vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
vim.cmd [[hi NvimTreeNormalNC guibg=NONE ctermbg=NONE]]
vim.opt.nu = true
vim.opt.relativenumber = true
vim.cmd [[let &stc=' ' . '%#NonText#%{&nu?v:lnum:""}' . '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' . '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}' . '│%T']]
