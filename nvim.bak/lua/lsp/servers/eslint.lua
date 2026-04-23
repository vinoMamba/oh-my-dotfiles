local M = {}


M.setup = function()
  local util = require 'lspconfig.util'

  vim.lsp.config('eslint', {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'vue',
      'svelte',
      'astro',
      'htmlangular',
    },
    root_dir = function(bufnr, on_dir)
      local root_file_patterns = {
        '.eslintrc',
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.yaml',
        '.eslintrc.yml',
        '.eslintrc.json',
        'eslint.config.js',
        'eslint.config.mjs',
        'eslint.config.cjs',
        'eslint.config.ts',
        'eslint.config.mts',
        'eslint.config.cts',
      }

      local fname = vim.api.nvim_buf_get_name(bufnr)
      root_file_patterns = util.insert_package_json(root_file_patterns, 'eslintConfig', fname)
      on_dir(vim.fs.dirname(vim.fs.find(root_file_patterns, { path = fname, upward = true })[1]))
    end,
  })
  vim.lsp.enable("eslint")
end

return M
