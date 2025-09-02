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

  -- vim.lsp.config("bufls", {
  --   cmd = { 'buf', 'beta', 'lsp', '--timeout=0', '--log-format=text' },
  --   filetypes = { 'proto' },
  --   root_markers = { 'buf.yaml', '.git' },
  -- })

  vim.lsp.config("protols", {
    cmd = { 'protols', '--include-paths=/Users/vino/.local/share/google' },
    filetypes = { 'proto' },
    root_markers = { '.git', 'buf.yaml' },
  })

  vim.lsp.enable("gopls")
  vim.lsp.enable("protols")
  -- vim.lsp.enable("bufls")
end

return M
