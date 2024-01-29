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
      "<cmd> GoTestPackage -v -F <CR>",
      "Run go test package",
    },
    ["<leader>rta"] = {
      "<cmd> GoTest -v -F <CR>",
      "Run go test all",
    },
    ["<leader>dtn"] = {
      "<cmd> GoDebug -n <CR>",
      "Debug test function",
    },
    ["<leader>dtf"] = {
      "<cmd> GoDebug -t <CR>",
      "Debug test file",
    },
    ["<leader>dts"] = {
      "<cmd> GoDbgStop <CR>",
      "Stop Debugging",
    },
    ["<leader>dtr"] = {
      "<cmd> GoDebug -R <CR>",
      "Re-run Debug",
    },
    ["<leader>dtp"] = {
      "<cmd> GoDebug -p <CR>",
      "Debug test for package",
    },
    ["<leader>db"] = {
      "<cmd> GoDebug -b <CR>",
      "Toggle Breakpoint",
    },
    ["<leader>dm"] = {
      "<cmd> GoDebug <CR>",
      "Debug main() func",
    },
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
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

return M
