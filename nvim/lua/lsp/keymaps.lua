local M = {}


function M.setup(bufnr)
	bufnr = bufnr or 0
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Definitions, references, etc.
	vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	-- vim.keymap.set('i', '<c-f>', vim.lsp.buf.signature_help, opts)

	-- Workspace management
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)


	-- Diagnostics
	-- vim.keymap.set('n', '<leader>-', function() vim.diagnostic.jump({ count = -1 }) end, opts)
	-- vim.keymap.set('n', '<leader>=', function() vim.diagnostic.jump({ count = 1 }) end, opts)
	-- vim.keymap.set('n', '<leader>t', ':Trouble<cr>', opts)
	--
	-- Format document
	vim.keymap.set('n', '<leader>f', function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end


return M
