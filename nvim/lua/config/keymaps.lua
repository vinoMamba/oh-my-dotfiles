-- Neovim快捷键绑定配置

local keymap = vim.keymap.set

-- 常用选项
local opts = { noremap = true, silent = true }

-- reload config
keymap("n", "<leader>r", ":source %<CR>", opts)

-- 保存 
keymap("n", "S", ":silent w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "s", "<NOP>", opts)

-- 命令模式绑定
keymap("n", ";", ":", { noremap = true })    -- 分号进入命令模式

-- 取消搜索高亮
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- 更好的上下移动
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap({"n","v"}, "J", "5gj", opts)
keymap({"n","v"}, "K", "5gk", opts)
keymap({"n","v"}, "H", "0", opts)      -- 快快速移动到行首
keymap({"n","v"}, "L", "$", opts)      -- 快速移动到行末尾

-- 窗口导航
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- 分割窗口
keymap("n", "<leader>sv", "<C-w>v", opts)     -- 垂直分割
keymap("n", "<leader>sh", "<C-w>s", opts)     -- 水平分割
keymap("n", "<leader>se", "<C-w>=", opts)     -- 窗口大小相等
keymap("n", "<leader>sx", "<cmd>close<CR>", opts) -- 关闭当前分割

-- 文本编辑
keymap("v", "<", "<gv", opts)     -- 左缩进后保持选中
keymap("v", ">", ">gv", opts)     -- 右缩进后保持选中

-- 插入模式快捷键
keymap("i", "jk", "<ESC>", opts)  -- jk退出插入模式

-- 全选
keymap("n", "<M-a>", "gg<S-v>G", opts)  -- Alt+a 表示全选

-- 复制粘贴优化
keymap("x", "<leader>p", [["_dP]], opts) -- 粘贴时不覆盖寄存器 
