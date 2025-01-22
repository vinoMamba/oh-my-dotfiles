local M = {}

M.attach = function(_client, bufnr)
  vim.keymap.set({ 'n' }, '<leader>k', vim.lsp.buf.hover, { buffer = bufnr, silent = true, noremap = true })
  vim.keymap.set({ 'n' }, 'gd', vim.lsp.buf.definition, { buffer = bufnr, silent = true, noremap = true })
  vim.keymap.set({ 'n' }, 'gr', vim.lsp.buf.references, { buffer = bufnr, silent = true, noremap = true })
  vim.keymap.set({ 'n' }, '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, silent = true, noremap = true })
end

return M
