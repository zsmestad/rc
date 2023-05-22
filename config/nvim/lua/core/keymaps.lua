vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local opts = { noremap = true }

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Windows - now configured with 'vim-tmux-navigator'
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
-- vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
-- vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<C-n>', ':Neotree toggle<cr>', opts)
vim.keymap.set('n', '<leader>b', ':Neotree toggle show buffers right<cr>', opts)

vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.keymap.set('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.keymap.set('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.keymap.set('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)
