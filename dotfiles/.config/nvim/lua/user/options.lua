local config_path = vim.fn.expand("~/.config/nvim")
local options = {
	number = true, -- always show line numbers
	wrap = false, -- don't wrap lines
	tags = "tags",
	tabstop = 2, -- a tab is two spaces
	softtabstop = 2, -- when hitting <BS>, pretend like a tab is removed, even if spaces
	expandtab = true, -- expand tabs by default (overloadable per file type later)
	shiftwidth = 2, -- number of spaces to use for autoindenting
	shiftround = true, -- use multiple of shiftwidth when indenting with '<' and '>'
	backspace = "indent,eol,start", -- allow backspacing over everything in insert mode
	autoindent = true, -- always autoindenting on
	copyindent = true, -- copy the previous indentation on autoindenting
	smartcase = true, -- ignore case if search pattern is all lowercase,
	ignorecase = true, -- Ignore case in searches
	timeout = true,
	timeoutlen = 200,
	ttimeoutlen = 100,
	visualbell = true, -- don't beep
	ruler = true,
	mouse = "a",
	laststatus = 2,
	showcmd = true,
	list = true,
	signcolumn = "yes",
	updatetime = 300,
	lazyredraw = true,
	encoding = "utf-8",
	hidden = true,
	foldmethod = "indent",
	foldnestmax = 10,
	foldenable = false,
	foldlevel = 2,
	splitbelow = true,
	splitright = true,
	undodir = { config_path .. "/.undo//" },
	backupdir = { config_path .. "/.backup//" },
	directory = { config_path .. "/.swp//" },
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[
  silent !stty -ixon
  set iskeyword+=-
]])
