return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    require('mason').setup()
    local lsp = require('lspconfig')
    local lsputil = require('config.lsp')

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    lsp.lua_ls.setup {
      on_attach = lsputil.attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" } -- 忽略 vim 全局变量的警告
          }
        }
      }
    }

    lsp.ts_ls.setup {
      on_attach = lsputil.attach,
      capabilities = capabilities,
    }

    lsp.tailwindcss.setup {
      on_attach = lsputil.attach,
      capabilities = capabilities,
    }
  end
}
