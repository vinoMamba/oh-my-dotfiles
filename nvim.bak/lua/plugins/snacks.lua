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
      },
    },
  },
  keys = {
    { "<leader>ff",       function() Snacks.picker.smart() end,                                     desc = "Smart Find Files" },
    { "<leader>,",        function() Snacks.picker.buffers() end,                                   desc = "Buffers" },
    { "<leader>/",        function() Snacks.picker.grep() end,                                      desc = "Grep" },
    { "<leader>e",        function() Snacks.explorer() end,                                         desc = "File Explorer" },
    { "<leader>fb",       function() Snacks.picker.buffers() end,                                   desc = "Buffers" },
    { "<leader><leader>", function() Snacks.picker.files() end,                                     desc = "Find Files" },
    { "<leader>fr",       function() Snacks.picker.recent() end,                                    desc = "Recent" },

    { "<leader>sh",       function() Snacks.picker.help() end,                                      desc = "Help Pages" },
    { "<leader>sk",       function() Snacks.picker.keymaps() end,                                   desc = "Keymaps" },
    { "<leader>la",       function() Snacks.lazygit() end,                                          desc = "Lazygit" },
    { "<leader>lh",       function() Snacks.picker.highlights() end,                                desc = "Search Highlight" },
    -- LSP
    { "gd",               function() Snacks.picker.lsp_definitions() end,                           desc = "Goto Definition" },
    { "gD",               function() Snacks.picker.lsp_declarations() end,                          desc = "Goto Declaration" },
    { "gi",               function() Snacks.picker.lsp_implementations() end,                       desc = "Goto Implementation" },
    { "gr",               function() Snacks.picker.lsp_references() end,                            nowait = true,                  desc = "References" },
    { "go",               function() Snacks.picker.lsp_type_definitions() end,                      desc = "Goto T[y]pe Definition" },
    { "<leader>fw",       function() Snacks.picker.grep({ search = vim.fn.expand("<cword>") }) end, desc = "Find Word" },
  }
}
