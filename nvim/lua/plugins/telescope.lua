return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
        local ts = require("telescope")
        ts.setup {
            defaults = {
              prompt_prefix = "🔎 ",
              selection_caret = "👉🏿",
              layout_strategy = "flex",
              layout_config = {
                prompt_position = "bottom",
                preview_width = 0.6,
              },
              -- `hidden = true` is not supported in text grep commands.
              vimgrep_arguments = vimgrep_arguments,
            },
            pickers = {
              find_files = {
                -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
              },
            },
            extensions = {
            }
        }

        -- key bindings
        vim.keymap.set('n','<leader><leader>', '<cmd>Telescope find_files<cr>',{ })
        vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
        vim.keymap.set("n", "<leader>;", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })

    end
  },
}
