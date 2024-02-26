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

local function open_nvim_tree(data)
  local real_file = vim.fn.filereadable(data.file) == 1
  local no_name = data.file == ""
  if real_file and not no_name then
    return
  end
  require("nvim-tree.api").tree.toggle({ focus = false })
  vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
  vim.cmd [[hi NvimTreeNormalNC guibg=NONE ctermbg=NONE]]
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.cmd [[set hlsearch]]
vim.opt.relativenumber = true
