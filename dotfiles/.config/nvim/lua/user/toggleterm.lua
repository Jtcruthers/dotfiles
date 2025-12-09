require("toggleterm").setup({})

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("t", "<leader>t", "<cmd>ToggleTerm direction=float<CR>")
