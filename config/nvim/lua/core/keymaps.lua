vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true }

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Windows - now configured with 'vim-tmux-navigator'
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
-- vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
-- vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Telescope
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)

vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.keymap.set('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.keymap.set('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.keymap.set('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

-- Neotree
vim.keymap.set('n', '<C-n>', ':Neotree toggle<cr>', opts)
vim.keymap.set('n', '<leader>b', ':Neotree toggle show buffers right<cr>', opts)
