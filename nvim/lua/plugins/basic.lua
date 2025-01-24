return {
  -- flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = function()
      return {
        { "S", false },
        {
          "\\",
          mode = { "n", "x", "o" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
      }
    end
  },
  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {}
  },
  -- yazi
  {

    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        '<leader>jo',
        "<cmd>Yazi cwd<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {},
    },
  },
  -- oil
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
  -- colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup {
        "lua",
        "typescriptreact"
      }
    end
  },

  --snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
    },
    keys = {
      { "<leader>bd", function() Snacks.bufdelete() end,   desc = "Delete Buffer" },
      { "<leader>la", function() Snacks.lazygit() end,     desc = "Lazygit" },
      { "<leader>gg", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Create some toggle mappings
          Snacks.toggle.dim():map("<leader>ud")
        end,
      })
    end,
  }
}
