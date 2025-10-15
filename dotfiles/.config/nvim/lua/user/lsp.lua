require("neoconf").setup {}

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, 'f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({})

require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = lsp_capabilities,
    }
  end,
  ["lua_ls"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup {
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
            }
          }
        }
      }
    }
  end,
  ["ts_ls"] = function()
    local init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/Users/justin/Library/pnpm/global/5/node_modules/@vue/typescript-plugin",
          languages = {"javascript", "typescript", "vue"},
        },
      },
    }
    require("lspconfig").ts_ls.setup {
      filetypes = { "vue", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      compilerOptions = {
        noErrorTruncate = true
      },
      init_options = init_options,
    }
  end,
  ["gopls"] = function()
    require("lspconfig").gopls.setup {
      capabilities = lsp_capabilities,
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "GoFmt",
        })
      end,
    }
  end,
  ["golangci_lint_ls"] = function()
    require("lspconfig").golangci_lint_ls.setup {
      capabilities = lsp_capabilities,
      cmd = { "golangci-lint-langserver" },
      init_options = {
        command = {
            "golangci-lint",
            "run",
            "--output.json.path",
            "stdout",
            "--show-stats=false",
            "--issues-exit-code=1",
        },
      }
    }
  end,
  ["eslint"] = function()
    require("lspconfig").eslint.setup {
      capabilities = lsp_capabilities,
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    }
  end
}

-- LSPs outside of Mason
require("lspconfig").gleam.setup({})
