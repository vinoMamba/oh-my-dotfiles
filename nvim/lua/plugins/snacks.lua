return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
  },
  keys = {
    { "<leader>la", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
  },
  init = function(opt)
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.dim():map("<leader>ud")
      end,
    })
  end,
  config = function(opt)
    -- Snacks.dim.enable(opt.dim)
  end
}
