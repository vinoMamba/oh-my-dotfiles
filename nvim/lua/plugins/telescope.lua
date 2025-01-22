return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local ts = require('telescope')
    ts.setup {
      defaults = {
        mappings = {
          n = {
            -- 在 normal 模式下，按下 q 退出 telescope
            ["q"] = require('telescope.actions').close,
          }
        },
        prompt_prefix = " 🔎 ",
        selection_caret = "👉",
        layout_strategy = "flex", -- 使用 flex 布局
        sorting_strategy = "ascending",
        layout_config = {
          flex = {
            flip_columns = 120, -- 当窗口宽度小于 120 列时切换到垂直布局
            flip_lines = 40,    -- 当窗口高度小于 40 行时切换到水平布局
          },
          horizontal = {
            preview_width = 0.6,     -- 水平布局下，预览窗口占 60% 宽度
            prompt_position = "top", -- 搜索框放在上面
            width = 0.8,             -- 整个布局占窗口宽度的 80%
            height = 0.8,            -- 整个布局占窗口高度的 80%
          },
          vertical = {
            preview_height = 0.5,    -- 垂直布局下，预览窗口占 50% 高度
            prompt_position = "top", -- 搜索框放在上面
            width = 0.8,             -- 整个布局占窗口宽度的 80%
            height = 0.8,            -- 整个布局占窗口高度的 80%
          },
        }
      },
      extensions = {
        fzf = {}
      }
    }

    require('telescope').load_extension('fzf')



    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope global fuzzy find' })
    vim.keymap.set('n', '<leader>;', builtin.current_buffer_fuzzy_find, { desc = 'Telescope current buffer fuzzy find' })
    vim.keymap.set('n', '<leader>o', builtin.resume, { desc = 'Telescope current buffer fuzzy find' })
    vim.keymap.set('n', '<leader>d', builtin.diagnostics, { desc = 'Telescope current buffer fuzzy find' })
  end
}
