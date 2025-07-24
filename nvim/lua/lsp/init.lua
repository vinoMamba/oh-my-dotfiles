
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»"
		},
	},
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

-- Set up CursorHold autocommand to show diagnostics on hover
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float({
			focusable = false,
			close_events = {
				"BufLeave",
				"CursorMoved",
				"InsertEnter",
				"FocusLost"
			},
			border = "rounded",
			source = "if_many",
			prefix = "",
		})
	end
})


vim.api.nvim_create_autocmd("LspAttach",{
	desc = 'LSP actions',
  callback = function(event)
		local ok, err = pcall(require('lsp.keymaps').setup, event.buf)
		if not ok then
			vim.notify("Failed to set up LSP keymaps: " .. tostring(err), vim.log.levels.WARN)
		end
  end

})


require('lsp.servers.lua_ls').setup()
