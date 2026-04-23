local M = {}


function M.setup(bufnr)
  bufnr = bufnr or 0
  local opts = { buffer = bufnr, noremap = true, silent = true }

  -- Definitions, references, etc.
  vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  -- Format document
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

return M
