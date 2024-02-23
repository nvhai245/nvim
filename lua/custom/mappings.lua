local M = {}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>tp"] = {
      "<cmd> TroubleToggle <CR>",
      "Toggle Trouble Panel"
    },
    ["<leader>tm"] = {
      "<cmd> lua vim.diagnostic.open_float() <CR>",
      "Show Diagnostic Messages"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>rtn"] = {
      "<cmd> GoTestFunc -v -F <CR>",
      "Run go test nearest function",
    },
    ["<leader>rtf"] = {
      "<cmd> GoTestFile -v -F <CR>",
      "Run go test file",
    },
    ["<leader>rtp"] = {
      "<cmd> GoTestPkg -v -F <CR>",
      "Run go test package",
    },
    ["<leader>rta"] = {
      "<cmd> GoTest -v -F <CR>",
      "Run go test all",
    },
    ["<leader>atn"] = {
      "<cmd> GoAddTest <CR>",
      "Add test for current func",
    },
    ["<leader>ata"] = {
      "<cmd> GoAddAllTest <CR>",
      "Add test for all funcs",
    },
    ["<leader>gsj"] = {
      "<cmd> GoAddTag json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoAddTag yaml <CR>",
      "Add yaml struct tags"
    },
    ["<leader>gsf"] = {
      "<cmd> GoFillStruct <CR>",
      "Fill Go Struct"
    },
    ["<leader>gsg"] = {
      "<cmd> GoJson2Struct <CR>",
      "Generate Go Struct From Json"
    },
  }
}

M.diffview = {
  plugin = true,
  n = {
    ["<leader>dif"] = {
      "<cmd> DiffviewOpen <CR>",
      "Open Diffview",
    },
    ["<leader>dic"] = {
      "<cmd> DiffviewClose <CR>",
      "Close Diffview",
    },
  }
}

M.lazygit = {
  plugin = true,
  n = {
    ["<leader>git"] = {
      "<cmd> LazyGit <CR>",
      "Open LazyGit",
    },
  }
}

M.lazydocker = {
  plugin = true,
  n = {
    ["<leader>ld"] = {
      "<cmd> LazyDocker <CR>",
      "Open LazyDocker",
    },
  }
}

M.dapui = {
  plugin = true,
  n = {
    ["<leader>du"] = {
      "<cmd> DapUiToggle <CR>",
      "Toggle DapUi",
    },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<F5>"] = {
      "<cmd> DapContinue <CR>",
      "Dap Continue",
    },
    ["<F10>"] = {
      "<cmd> DapStepOver <CR>",
      "Dap Step Over",
    },
    ["<F11>"] = {
      "<cmd> DapStepInto <CR>",
      "Dap Step Into",
    },
    ["<F12>"] = {
      "<cmd> DapStepOut <CR>",
      "Dap Step Out",
    },
    ["<F9>"] = {
      "<cmd> DapTerminate <CR>",
      "Dap Terminate",
    },
    ["<leader>dr"] = {
      "<cmd> DapRerun <CR>",
      "Dap Rerun",
    },
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Dap Toggle Breakpoint",
    },
  }
}

M.dapgo = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      "<cmd> lua require('dap-go').debug_test() <CR>",
      "Debug Go Nearest Test",
    }
  }
}

M.lspconfig = {
  plugin = true,
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      "<cmd> Telescope lsp_definitions <CR>",
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      "<cmd> Telescope lsp_implementations <CR>",
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>gt"] = {
      "<cmd> Telescope lsp_type_definitions <CR>",
      "LSP definition type",
    },

    ["<leader>D"] = {
      "<cmd> Telescope diagnostics bufnr=0 <CR>",
      "LSP buffer diagnostics",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      "<cmd> Telescope lsp_references <CR>",
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

return M
