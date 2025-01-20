vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

vim.opt.tabstop = 4         -- 一个 Tab 等于 4 个空格
vim.opt.shiftwidth = 4      -- 自动缩进时的空格数
vim.opt.expandtab = true    -- 将 Tab 转换为空格
vim.opt.autoindent = true   -- 自动缩进
vim.opt.smartindent = true  -- 智能缩进（根据语法自动调整）


vim.opt.ignorecase = true   -- 搜索时忽略大小写
vim.opt.smartcase = true    -- 如果搜索包含大写字母，则区分大小写
vim.opt.hlsearch = true     -- 高亮显示搜索结果
vim.opt.incsearch = true    -- 实时显示搜索匹配


vim.opt.clipboard = "unnamedplus" -- 与系统剪贴板共享
vim.opt.termguicolors = true -- 启用真彩色支持（用于主题和语法高亮）
vim.opt.mouse = "a"          -- 启用鼠标支持（所有模式）


vim.opt.cursorline = true    -- 高亮当前行
vim.opt.signcolumn = "yes"   -- 始终显示标记列（用于 Git 和 LSP 提示）
vim.opt.wrap = false         -- 不自动换行
vim.opt.showmode = false     -- 不显示模式（如 INSERT、NORMAL 等）


vim.opt.foldmethod = "indent" -- 基于缩进折叠
vim.opt.foldlevel = 99        -- 默认不折叠


vim.opt.splitright = true    -- 垂直分屏时新窗口在右侧
vim.opt.splitbelow = true    -- 水平分屏时新窗口在下侧

vim.opt.showcmd = true       -- 显示命令输入
vim.opt.cmdheight = 1        -- 命令行高度
vim.opt.laststatus = 2       -- 总是显示状态栏

vim.opt.scrolloff = 8        -- 光标距离顶部/底部的最小行数
vim.opt.sidescrolloff = 8    -- 光标距离左侧/右侧的最小列数
