local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- neo-tree setting
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("lazy").setup({
  -- Theme
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
  },
  'nvim-lualine/lualine.nvim',

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  'nvim-treesitter/nvim-treesitter',

  -- UI to select things (files, grep results, open buffers...)
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  { 'folke/which-key.nvim' },

  -- Git
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'TimUntersberger/neogit', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Additional textobjects for treesitter
  'nvim-treesitter/nvim-treesitter-textobjects',
  'neovim/nvim-lspconfig',

  -- Complation
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',

  'echasnovski/mini.nvim',
  { 'nvim-neo-tree/neo-tree.nvim',
      branch = 'v2.x',
      dependencies = {
        'MunifTanjim/nui.nvim',
        'kyazdani42/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
    }
  },

  'christoomey/vim-tmux-navigator',
  'HigherOrderCO/Kind.nvim',
})
