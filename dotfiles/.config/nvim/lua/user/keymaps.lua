local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { silent = true })
end

function noremap(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- Normal --
-- Better window navigation
noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")

-- Create windows
map("n", "<leader>v", ":vsp<CR>")
map("n", "<leader>s", ":sp<CR>")

-- Up and Down treat end-of-line as markers
noremap("n", "j", "gj")
noremap("n", "k", "gk")

-- Resize with arrows
noremap("n", "<S-Up>", ":resize -2<CR>")
noremap("n", "<S-Down>", ":resize +2<CR>")
noremap("n", "<S-Left>", ":vertical resize -2<CR>")
noremap("n", "<S-Right>", ":vertical resize +2<CR>")

-- Delete buffers
noremap("n", "<leader>w", "<Cmd>lua MiniBufremove.delete()<CR>") -- delete buffer, keep window
noremap("n", "<leader>q", "<Cmd>bdelete<CR>") -- delete buffer, keep window

-- bracket navigation to git hunks
noremap("n", "[c", "<Cmd>lua MiniDiff.goto_hunk('prev')<CR>") -- delete buffer, keep window
noremap("n", "[C", "<Cmd>lua MiniDiff.goto_hunk('first')<CR>") -- delete buffer, keep window
noremap("n", "]c", "<Cmd>lua MiniDiff.goto_hunk('next')<CR>") -- delete buffer, keep window
noremap("n", "]C", "<Cmd>lua MiniDiff.goto_hunk('last')<CR>") -- delete buffer, keep window

-- ,cd changes directory to current files dir
noremap("n", ",cd", [[<Cmd>execute 'cd '.expand('%:p:h')<CR>:pwd<CR>]])

vim.api.nvim_set_keymap("n", "G", "v:lua.goto_end_or_start()", { expr = true, noremap = true })
function _G.goto_end_or_start()
	if vim.fn.line(".") == vim.fn.line("$") then
		return "gg"
	else
		return "G"
	end
end

-- Visual --
-- Stay in indent mode
noremap("v", "<", "<gv")
noremap("v", ">", ">gv")

-- Terminal --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")

noremap("n", ";;", ":Pick git_files<CR>")
noremap("n", ";f", ":Pick files<CR>")
noremap("n", ";s", ":Pick grep_live<CR>")
noremap("n", ";d", ":Pick diagnostics<CR>")
noremap("n", ";b", ":Pick buffers<CR>")
noremap("n", ";b", ":Pick git_files<CR>")
