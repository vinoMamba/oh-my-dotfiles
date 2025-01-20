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
 }
}
