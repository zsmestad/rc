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

require("lazy").setup({
  -- Theme/Info
  { 'navarasu/onedark.nvim', lazy = false, priority = 1000 },
  'nvim-lualine/lualine.nvim',
  'folke/which-key.nvim',

  -- LSP
  'neovim/nvim-lspconfig',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- Completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',

  -- Snippets
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  -- Comments, Surround, others
  'echasnovski/mini.nvim',

  -- Navigation
  'christoomey/vim-tmux-navigator',
  { 'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    }
  },

  -- { 'stevearc/oil.nvim', dependencies = { "nvim-tree/nvim-web-devicons" } },

  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Git
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'TimUntersberger/neogit', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Language
  -- 'HigherOrderCO/Kind.nvim',
})
