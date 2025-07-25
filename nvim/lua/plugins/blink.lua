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
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
       providers = {
                lazydev = {
                  name = "LazyDev",
                  module = "lazydev.integrations.blink",
                  score_offset = 100,
                },
              },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
