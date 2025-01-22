require("config.options")
require("config.keymaps")
require("config.lazy")

vim.api.nvim_create_user_command('Bonly', function()
  local cb = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and buf ~= cb then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, {})
