set nocompatible
" Otherwise grey...
hi SignColumn ctermbg=none

" https://github.com/junegunn/vim-plug/wiki/faq#conditional-activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
let g:ale_completion_enabled = 1

" --Plugins--
call plug#begin('~/.config/nvim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Util
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'

" File browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Comments and Quotes
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Change path to git root
Plug 'airblade/vim-rooter'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Terraform
Plug 'hashivim/vim-terraform'

" Rust
Plug 'simrat39/rust-tools.nvim'

" Python
Plug 'cstrap/python-snippets'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" enable syntax highlighting
syntax enable
filetype plugin indent on

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

lua require('settings')
lua require('maps')

" --Plugin Settings--
lua require('plugins')
lua require('lsp_config')

" --Filetypes--
au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile .envrc,.envrc.local set filetype=bash
au BufRead,BufNewFile go.mod set filetype=go
au BufWritePre *.go lua vim.lsp.buf.formatting()
" au BufWritePre *.go lua goimports(1000)

au FileType go     set ts=4 sw=4 noet lcs=tab:\ \ ,trail:-
au FileType ld,asm set ts=4 sw=4 sts=4
au FileType make   set ts=4 sw=4 noet lcs=tab:\ \ ,trail:-
au FileType python set ts=4 sw=4 sts=4

" automatically rebalance windows on vim resize
au VimResized * :wincmd =

" TMUX
if &term == "screen-256color"
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif

