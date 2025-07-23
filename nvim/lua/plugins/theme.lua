return {
  "loctvl842/monokai-pro.nvim",
  opts ={
    filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
  },
  config = function()
    vim.cmd([[colorscheme monokai-pro]])
  end
}
