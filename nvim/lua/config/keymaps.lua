vim.g.mapleader = " " -- 设置 Leader 键为空格
vim.g.maplocalleader = " " -- 设置本地 Leader 键（可选）

vim.keymap.set("i", "jk", "<ESC>", { desc = "Quit insert mode" })
vim.keymap.set("n", "S", ":silent w<CR>", { desc = "Save file", silent = true })


vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
vim.keymap.set("n", "s", "<NOP>")
vim.keymap.set("n", ";", ":")

-- Move
vim.keymap.set({ "n", "v" }, "L", "$",  { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "H", "^",  { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "K", "5k", { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "J", "5j", { silent = true, noremap = true })

