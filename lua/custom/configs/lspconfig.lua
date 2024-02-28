local on_attach = require("plugins.configs.lspconfig").on_attach
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  command = { "htmlhint", "--format", "json" },
}
