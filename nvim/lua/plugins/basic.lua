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
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      '<leader>jo',
      "<cmd>Yazi cwd<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = false,
    keymaps = {},
  },
  } 
}
