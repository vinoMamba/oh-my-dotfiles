return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            layout = {
              position = "right"
            }
          }
        }
      }
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
    { "<leader>,",        function() Snacks.picker.buffers() end,               desc = "Buffers" },
    { "<leader>/",        function() Snacks.picker.grep() end,                  desc = "Grep" },
    { "<leader>e",        function() Snacks.explorer() end,                     desc = "File Explorer" },
    { "<leader>fb",       function() Snacks.picker.buffers() end,               desc = "Buffers" },
    { "<leader><leader>", function() Snacks.picker.files() end,                 desc = "Find Files" },
    { "<leader>fr",       function() Snacks.picker.recent() end,                desc = "Recent" },

    { "<leader>sh",       function() Snacks.picker.help() end,                  desc = "Help Pages" },
    { "<leader>sk",       function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
    { "<leader>la",       function() Snacks.lazygit() end,                      desc = "Lazygit" },
  },
}
