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
    {
      "ray-x/go.nvim",
      dependencies = { -- optional packages
        "ray-x/guihua.lua",
      },
      config = function()
        require("go").setup()
        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
            require('go.format').gofmt()
            require('go.format').goimports()
          end,
          group = format_sync_grp,
        })
      end,
      event = { "CmdlineEnter" },
      ft = { "go", 'gomod' },
      build = ':lua require("go.install").update_all_sync()'
    }
  },
  config = function()
    require('mason').setup()
    local lsp = require('lspconfig')
    local lsputil = require('config.lsp')
    lsputil.custom_diagnostic()

    local capabilities = require('blink.cmp').get_lsp_capabilities()


    lsp.lua_ls.setup {
      on_attach = lsputil.attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "Snacks" } -- 忽略 vim 全局变量的警告
          }
        }
      }
    }

    local mason_registry = require('mason-registry')
    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
        '/node_modules/@vue/language-server'

    lsp.ts_ls.setup {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue"
      },
      on_attach = lsputil.attach,
      capabilities = capabilities,
    }
    lsp.volar.setup {}

    lsp.tailwindcss.setup {
      on_attach = lsputil.attach,
      capabilities = capabilities,
      filetypes = {
        'css',
        'javascriptreact',
        'typescriptreact',
        'html',
        'vue'
      }
    }

    lsp.eslint.setup {
      on_attach = lsputil.eslint_attach,
      capabilities = capabilities,
    }


    lsp.gopls.setup {
      on_attach = lsputil.attach,
      capabilities = capabilities,
    }
  end
}
