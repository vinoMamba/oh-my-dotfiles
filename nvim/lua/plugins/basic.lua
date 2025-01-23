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
  }
}
