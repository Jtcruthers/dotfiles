set nowrap                      " don't wrap lines
set tags=tags
set tabstop=2                   " a tab is two spaces
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set mouse=a
set ruler
set laststatus=2
set showcmd
set ignorecase  " Ignore case in searches
set smartcase   " Make searches case sensitive if capital letter is used
set list
set signcolumn=yes
set updatetime=300
set noswapfile
set lazyredraw
set encoding=utf-8

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap fa za

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType toml setlocal ts=2 sts=2 sw=2
  
" Down is really the next line
nnoremap j gj
nnoremap k gk

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation
nmap <Leader>d :vsp<CR>
nmap <Leader>s :sp<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

set splitbelow
set splitright


"Vim-Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'

Plug 'alvan/vim-closetag'

Plug 'christoomey/vim-tmux-navigator'

Plug 'qpkorr/vim-bufkill'

Plug 'github/copilot.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'leafOfTree/vim-matchtag'

Plug 'folke/neodev.nvim'

Plug 'voldikss/vim-floaterm'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

call plug#end()

syntax on

"Vim Plugin Maps
map ; :GFiles<CR>

let g:closetag_filenames = '*.html,*.js, *.jsx'
let g:ale_linter_aliases = {'vue': ['css', 'javascript', 'typescript']}
let g:ale_linters = { 'javascript': ['eslint', 'prettier'], 'jsx': ['eslint'], 'python': ['pylint'], 'vue': ['eslint', 'prettier'], 'json': ['eslint', 'prettier'] } 
let g:ale_fixers = {'vue': ['eslint', 'prettier'], 'typescript': ['eslint', 'prettier'], 'javascript': ['eslint', 'prettier'], 'python': ['autopep8'], 'html': ['eslint', 'prettier'], 'json': ['eslint', 'prettier'], 'go': ['gofmt', 'goimports', 'golines' ], 'rust': 'rustfmt' }
let g:ale_virtualenv_dir_names = []
let g:UltiSnipsExpandTrigger="<C-c>"
let g:closetag_filetypes = 'html,xhtml,xml,vue'
let g:vimspector_enable_mappings = 'Human'

set hidden
silent !stty -ixon
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>
nnoremap <C-Q> :BD<CR>
nnoremap <C-W> :bdelete<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>g :FloatermNew lazygit<CR>
nnoremap <Leader>t :FloatermToggle<CR>
tnoremap <Leader>t <C-\><C-n>:FloatermToggle<CR>


let g:floaterm_height = 0.85
let g:floaterm_width = 0.85
let g:floaterm_position = 'center'
let g:floaterm_autoinsert = 1
let g:floaterm_keymap_next = '<Leader>r'

:command JsonFormat %!python -m json.tool

" G to go to bottom, G again to go to the top
nnoremap <expr> G line('.') == line('$') ? 'gg' : 'G'

function! CheckBackSpace()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackSpace() ? "\<Tab>" :
  \ coc#refresh()

inoremap <silent><expr> <S-Tab>
  \ coc#pum#visible() ? coc#pum#prev(1) :
  \ CheckBackSpace() ? "\<S-Tab>" :
  \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <leader>rn <Plug>(coc-rename)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

map <leader>z :NERDTreeFind<cr>

" Important to make colorscheme look like it should
if has('termguicolors')
  set termguicolors
endif

lua << EOF
require("bufferline").setup{
  options = {
    diagnostics = "coc",
  }
}
EOF

colorscheme catppuccin
let g:airline_theme = 'catppuccin_mocha'
