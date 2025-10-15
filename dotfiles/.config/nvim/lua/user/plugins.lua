local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  { "nvim-lua/popup.nvim" },
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-treesitter/nvim-treesitter",            build = ':TSUpdate' },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  "folke/neoconf.nvim",

  -- UI
  { "akinsho/bufferline.nvim",  version = "*" },
  { "nvim-lualine/lualine.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "qpkorr/vim-bufkill" },
  { "moll/vim-bbye",            commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
  { "RRethy/vim-illuminate" },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      open_mapping = [[<leader>t]],
      autochdir = true,
    }
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },
  "folke/which-key.nvim",

  -- LSP
  "williamboman/mason.nvim", -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",   -- enable LSP
  "darrikonn/vim-gofmt",
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = {
      keymaps = {
        toggle = '<leader>ww',          -- default '<leader>dd'
        go_to_definition = '<leader>wd' -- default '<leader>dx'
      }
    }
  },

  -- Completion
  { "hrsh7th/nvim-cmp" },   -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" },   -- path completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "saadparwaiz1/cmp_luasnip" },                                            -- snippet completions
  { "L3MON4D3/LuaSnip",            version = "v2.*", build = "make install_jsregexp" }, --snippet engine
  { "rafamadriz/friendly-snippets" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    lazy = true,
  },
  "zbirenbaum/copilot-cmp",
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end
  },


  -- Telescope
  { "nvim-telescope/telescope.nvim",            branch = "0.1.x" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  "camgraff/telescope-tmux.nvim",

  { "christoomey/vim-tmux-navigator" },

  { "catppuccin/nvim",               name = "catppuccin", priority = 1000 },

  -- Backend
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  }
})
