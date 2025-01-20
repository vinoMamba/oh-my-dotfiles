require("config.options")
require("config.keymaps")
require("config.lazy")

vim.api.nvim_create_autocmd("BufWritePost",{
	pattern = "lua/config/*.lua",
  callback = function()
  	local function reload_module(module_name)
    	package.loaded[module_name] = nil
      require(module_name)
    end
    reload_module("options")
    reload_module("keymaps")
  end
})
