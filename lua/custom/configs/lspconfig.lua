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

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require('schemastore').yaml.schemas {
        select = {
          'kustomization.yaml',
          'docker-compose.yml'
        },
      }
    }
  }
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        useLibraryCodeForTypes = true
      }
    }
  }
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true }
    }
  }
}

lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.vimls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
