return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    'Kaiser-Yang/blink-cmp-avante',
    -- {
    --   "fang2hou/blink-copilot",
    --   opts = {
    --     max_completions = 1, -- Global default for max completions
    --     max_attempts = 2,  -- Global default for max attempts
    --   }
    -- }
  },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = { auto_show = true },
      menu = {
        draw = {
          columns = {
            { "label",      "label_description", gap = 1 },
            { "kind_icon",  "kind",              gap = 1 },
            { "source_name" },
          },
        },
      },
    },
    sources = {
      default = { 'avante', 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        -- copilot = {
        --   name = "copilot",
        --   module = "blink-copilot",
        --   score_offset = 100,
        --   async = true,
        --   opts = {
        --     max_completions = 3,
        --   },
        -- },
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
          opts = {
            -- options for blink-cmp-avante
          }
        }
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
