local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Dap Continue"
    }
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.dap_ui = {
  plugin = true,
  n = {
    ["<leader>dut"] = {
      function ()
        require("dapui").toggle()
      end,
      "Toggle Dap UI"
    },
    ["<leader>dur"] = {
      function()
        require('dapui').open({ reset = true })
      end,
      "Reset Dap UI"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

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

return M
