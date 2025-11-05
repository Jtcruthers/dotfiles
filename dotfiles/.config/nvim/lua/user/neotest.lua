local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

local vitest = require("neotest-vitest")({
  filter_dir = function(name)
    local ignore_dirs = { "e2e", "node_modules", "dist", "build" }
    return not vim.tbl_contains(ignore_dirs, name)
  end,
})

local golang = require("neotest-golang")({
  runner = "gotestsum",
  warn_test_name_dupes = false,
})

local python = require("neotest-python")({
  runner = "pytest",
  python = ".venv/bin/python",
})

neotest.setup({
  adapters = {
    vitest,
    golang,
    python,
  },
})

vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run current file" })
vim.keymap.set("n", "<leader>ta", function() neotest.run.run(vim.fn.getcwd()) end, { desc = "Run all tests" })
vim.keymap.set("n", "<leader>tl", function() neotest.run.run_last() end, { desc = "Run last test" })

vim.keymap.set("n", "<leader>td", function() neotest.run.run({strategy = "dap"}) end, { desc = "Debug nearest test (need to setup DAP tho)" })

vim.keymap.set("n", "<leader>to", function() neotest.output.open({enter = true, auto_close = true }) end, { desc = "Open test output" })
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })

vim.keymap.set("n", "<leader>tS", function() neotest.run.stop() end, { desc = "Stop test run" })

vim.keymap.set("n", "<leader>tw", function() neotest.watch.toggle(vim.fn.expand("%")) end, { desc = "Watch current file" })
vim.keymap.set("n", "<leader>tW", function() neotest.watch.toggle(vim.fn.getcwd()) end, { desc = "Watch all tests" })
