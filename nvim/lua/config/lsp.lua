local M = {}


M.attach = function(_client, bufnr)
  vim.keymap.set({ 'n' }, '<leader>k', vim.lsp.buf.hover, { buffer = bufnr, silent = true, noremap = true })
  vim.keymap.set({ 'n' }, 'gd', vim.lsp.buf.definition, { buffer = bufnr, silent = true, noremap = true })
  vim.keymap.set({ 'n' }, 'gr', vim.lsp.buf.references, { buffer = bufnr, silent = true, noremap = true })
  vim.keymap.set({ 'n' }, '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, silent = true, noremap = true })
end

M.eslint_attach = function(client, bufnr)
  M.attach(client, bufnr)
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    command = 'EslintFixAll'
  })
end


M.custom_diagnostic = function()
  vim.opt.updatetime = 100    -- 设置 updatetime 为 100 毫秒
  vim.diagnostic.config({
    virtual_text = false,     -- 在行内显示虚拟文本
    signs = false,
    underline = true,         -- 在错误代码下方显示下划线
    update_in_insert = false, -- 在插入模式下不更新诊断信息
    severity_sort = true,     -- 按严重程度排序诊断信息
    float = {                 -- 配置浮动窗口
      source = true,          -- 显示诊断信息的来源（如 tsserver、eslint）
      focusable = false,      -- 浮动窗口不可聚焦
      style = "minimal",      -- 最小化样式
      border = "rounded",     -- 圆角边框
      header = "",            -- 不显示标题
      prefix = "",            -- 不显示前缀
    },
  })
  -- 光标悬停时显示浮动窗口
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      vim.diagnostic.open_float(nil, {
        focusable = false,
      })
    end,
  })
end


return M
