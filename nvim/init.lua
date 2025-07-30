vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

require "config.keymaps"
require "config.options"
require "config.lazy"
require "lsp"
