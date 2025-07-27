return {
  'everviolet/nvim',
  name = 'evergarden',
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  config = function()
    require 'evergarden'.setup {
      theme = {
        variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'purple',
      },
      editor = {
        transparent_background = true,
        override_terminal = true,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          solid_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
      style = {
        tabline = { 'reverse' },
        search = { 'italic', 'reverse' },
        incsearch = { 'italic', 'reverse' },
        types = { 'italic' },
        keyword = { 'italic' },
        comment = { 'italic' },
        spell = { 'undercurl' },
      },
      overrides = {},
      color_overrides = {},
      integrations = {
        blink_cmp = true,
        cmp = true,
        fzf_lua = true,
        gitsigns = true,
        indent_blankline = { enable = true, scope_color = 'green' },
        mini = {
          enable = true,
          animate = true,
          clue = true,
          completion = true,
          cursorword = true,
          deps = true,
          diff = true,
          files = true,
          hipatterns = true,
          icons = true,
          indentscope = true,
          jump = true,
          jump2d = true,
          map = true,
          notify = true,
          operators = true,
          pick = true,
          starters = true,
          statusline = true,
          surround = true,
          tabline = true,
          test = true,
          trailspace = true,
        },
        nvimtree = true,
        rainbow_delimiters = true,
        symbols_outline = true,
        telescope = true,
        which_key = true,
        neotree = true,
      },
    }
    vim.cmd.colorscheme 'evergarden'
  end,
}
-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000 ,
--     config = function ()
--       require("catppuccin").setup({
--     flavour = "auto", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = false, -- disables setting the background color.
--     show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--     term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--     dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { "italic" }, -- Change the style of comments
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--         -- miscs = {}, -- Uncomment to turn off hard-coded styles
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     default_integrations = true,
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         notify = false,
--         mini = {
--             enabled = true,
--             indentscope_color = "",
--         },
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })
--
-- -- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
--     end
--   }
-- "loctvl842/monokai-pro.nvim",
-- opts ={
--   filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
-- },
-- config = function()
--   vim.cmd([[colorscheme monokai-pro]])
-- end
-- }
