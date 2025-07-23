local opt = vim.opt

-- 外观设置
opt.number = true           -- 显示行号
opt.relativenumber = true   -- 显示相对行号
opt.cursorline = true       -- 高亮当前行
opt.signcolumn = "yes"      -- 始终显示符号列
opt.wrap = false            -- 不自动换行
opt.scrolloff = 8           -- 光标上下保持8行距离
opt.sidescrolloff = 8       -- 光标左右保持8列距离

-- 缩进设置
opt.tabstop = 2             -- tab宽度为4个空格
opt.softtabstop = 2         -- 软tab宽度
opt.shiftwidth = 2          -- 自动缩进宽度
opt.expandtab = true        -- 使用空格替代tab
opt.autoindent = true       -- 自动缩进
opt.smartindent = true      -- 智能缩进

-- 搜索设置
opt.ignorecase = true       -- 搜索忽略大小写
opt.smartcase = true        -- 智能大小写搜索
opt.hlsearch = true         -- 高亮搜索结果
opt.incsearch = true        -- 增量搜索

-- 编辑体验
opt.mouse = "a"             -- 启用鼠标支持
opt.clipboard = "unnamedplus" -- 使用系统剪贴板
opt.undofile = true         -- 持久化撤销历史
opt.backup = false          -- 不创建备份文件
opt.writebackup = false     -- 写入时不创建备份
opt.swapfile = false        -- 不创建交换文件

-- 分割窗口
opt.splitbelow = true       -- 水平分割时新窗口在下方
opt.splitright = true       -- 垂直分割时新窗口在右方

-- 性能设置
opt.updatetime = 300        -- 更新时间（毫秒）
opt.timeoutlen = 500        -- 按键序列超时时间

-- 文件编码
opt.encoding = "utf-8"      -- 内部编码
opt.fileencoding = "utf-8"  -- 文件编码 

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
vim.opt.winborder = 'rounded'
