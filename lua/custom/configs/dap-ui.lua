local dap, dapui, nvimtree = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.toggle()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.toggle()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.toggle()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.toggle()
end
