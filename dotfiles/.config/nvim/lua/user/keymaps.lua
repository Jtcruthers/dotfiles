local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { silent = true })
end

function noremap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   command_mode = "c",
--   term_mode = "t",

-- Normal --
-- Better window navigation
noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")

-- Create windows
map("n", "<leader>d", ":vsp<CR>")
map("n", "<leader>s", ":sp<CR>")

-- Up and Down treat end-of-line as markers
noremap("n", "j", "gj")
noremap("n", "k", "gk")

-- Resize with arrows
noremap("n", "<S-Up>", ":resize -2<CR>")
noremap("n", "<S-Down>", ":resize +2<CR>")
noremap("n", "<S-Left>", ":vertical resize -2<CR>")
noremap("n", "<S-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
noremap("n", "<C-n>", ":bnext<CR>")
noremap("n", "<C-p>", ":bprevious<CR>")
noremap("n", "<C-q>", ":bdelete<CR>")
noremap("n", "<C-w>", ":BD<CR>")

-- ,cd changes directory to current files dir
noremap("n", ",cd", [[<Cmd>execute 'cd '.expand('%:p:h')<CR>:pwd<CR>]])

vim.api.nvim_set_keymap("n", "G", "v:lua.goto_end_or_start()", { expr = true, noremap = true })
function _G.goto_end_or_start()
    if vim.fn.line('.') == vim.fn.line('$') then
        return 'gg'
    else
        return 'G'
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
