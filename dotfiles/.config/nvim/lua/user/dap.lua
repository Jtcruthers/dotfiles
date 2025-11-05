local dap = require("dap")
local dapui = require("dapui")

-- Setup dap-ui
dapui.setup()

-- Setup virtual text
require("nvim-dap-virtual-text").setup()

-- Auto-open/close UI
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue/Start debugging" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  adapters = { "pnpm", "node", "chrome", "pwa-node", "pwa-chrome" },
})

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Vitest Tests",
      cwd = vim.fn.getcwd(),
      program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
      args = { "run", "${file}" },
      autoAttachChildProcesses = true,
      smartStep = true,
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
  }
end

require("dap-go").setup {}

vim.keymap.set("n", "<leader>tG", function() require('dap-go').debug_test() end, { desc = "Watch all tests" })
