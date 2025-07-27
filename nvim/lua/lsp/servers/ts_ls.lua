local M = {}

M.setup = function()
  vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    on_attach = function(client, bufnr)
      print(client.name)
    end
  })

  vim.lsp.enable("ts_ls")
end

return M
