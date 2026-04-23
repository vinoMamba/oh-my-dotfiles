local M = {}


M.setup = function()
  vim.lsp.config('marksman', {
    cmd = { 'marksman', 'server' },
    root_markers = { '.marksman.toml', '.git' },
    filetypes = { 'markdown', 'markdown.mdx' },
    single_file_support = true,
  })
  vim.lsp.enable("marksman")
end

return M

