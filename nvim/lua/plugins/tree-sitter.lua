return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require 'nvim-treesitter.configs'.setup {
      auto_install = false,
      ensure_installed = {
        "c",
        "css",
        "go",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "scheme",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml"
      },
      highlight = {
        enable = true,
      }
    }
  end
}
