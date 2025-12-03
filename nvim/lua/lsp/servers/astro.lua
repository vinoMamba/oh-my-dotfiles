local M = {}

M.setup = function()
  vim.lsp.config('astro', {
    cmd = { 'astro-ls', '--stdio' },
    filetypes = { 'astro' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    on_attach = function(client, bufnr)
      print(client.name)
    end
  })

  vim.lsp.enable("astro")
end

return M