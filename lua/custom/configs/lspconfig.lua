local on_attach = require("plugins.configs.lspconfig").on_attach
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gunk" },
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

lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'postgres://platform:platform@localhost:5437/platform?sslmode=disable',
        },
        {
          driver = 'postgresql',
          dataSourceName = 'postgres://sso:sso@localhost:5438/sso?sslmode=disable',
        },
        {
          driver = 'postgresql',
          dataSourceName = 'postgres://ide:ide@localhost:5439/ide?sslmode=disable',
        },
        {
          driver = 'postgresql',
          dataSourceName = 'postgres://cms:cms@localhost:5436/cms?sslmode=disable',
        },
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
  on_attach = on_attach,
  capabilities = capabilities,
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

lspconfig.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.regal.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
