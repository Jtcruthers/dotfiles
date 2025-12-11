local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { silent = true })
end

function noremap(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- Create windows
map("n", "<leader>v", ":vsp<CR>")
map("n", "<leader>s", ":sp<CR>")

-- Up and Down treat end-of-line as markers
noremap("n", "j", "gj")
noremap("n", "k", "gk")

-- Resize with arrows
noremap("n", "<M-k>", ":resize -2<CR>")
noremap("n", "<M-j>", ":resize +2<CR>")
noremap("n", "<M-l>", ":vertical resize -5<CR>")
noremap("n", "<M-h>", ":vertical resize +5<CR>")

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

function get_cwd(local_opts)
	local_opts = local_opts or {}

	-- Find the git root directory
	local git_root = vim.fs.root(0, ".git")

	-- Fall back to current working directory if not in a git repo
	if not git_root then
		return vim.fn.getcwd()
	end

	return git_root
end

vim.keymap.set("n", ";;", function()
	MiniExtra.pickers.git_files({ path = get_cwd() })
end)
noremap("n", ";f", ":Pick files<CR>")
noremap("n", ";s", ":Pick grep_live<CR>")
noremap("n", ";d", ":Pick diagnostic<CR>")
noremap("n", ";b", ":Pick buffers<CR>")

vim.keymap.set("n", "<leader>m", ":Markview toggle<CR>")
