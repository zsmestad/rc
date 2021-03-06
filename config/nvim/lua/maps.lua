local map = vim.api.nvim_set_keymap
local g   = vim.g
map('', ',', '<Nop>', { noremap = true, silent = true })
g.mapleader = ','
g.maplocalleader = ','

map('n', ',', '', {})

-- Move easily between windows
-- iTerm2 issue: Set ^h to send escape code '[104;5u'
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})

map("n", "<C-n>", ":NERDTreeToggle<cr>", {})
map("n", "<leader>n", ":NERDTreeToggle<cr>", {})
map("n", "<leader>f", ":NERDTreeFind<cr>", {})

map("n", "<leader>F", ":FZF<cr>", {})
