return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()

    vim.fn.sign_define('DiagnosticSignError', { texthl = 'DiagnosticSignError', text = '❌', numhl = "" })
    vim.fn.sign_define('DiagnosticSignWarn', { texthl = 'DiagnosticSignWarn', text = '⚠️', numhl = "" })
    vim.fn.sign_define('DiagnosticSignHint', { texthl = 'DiagnosticSignHint', text = '⛳', numhl = "" })
    vim.fn.sign_define('DiagnosticSignInfo', { texthl = 'DiagnosticSignInfo', text = '💬', numhl = "" })


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
  end
}
