return  {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "lua", "vim", "vimdoc" },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
    }
  end
}

