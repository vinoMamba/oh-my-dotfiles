local M = {}

M.setup = function()
  vim.lsp.config("gopls", {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  })

  vim.lsp.config("protols", {
    cmd = { 'protols' },
    filetypes = { 'proto' },
    root_markers = { '.git' },
  })

  vim.lsp.enable("gopls")
  vim.lsp.enable("protols")
end

return M
