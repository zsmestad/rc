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

Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

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

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Terraform
Plug 'hashivim/vim-terraform'

" Markdown
if has('mac')
  Plug 'junegunn/vim-xmark', Cond(has('mac'), { 'do': 'make', 'for': 'markdown' })
endif
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Rust
" Plug 'cespare/vim-toml'
Plug 'simrat39/rust-tools.nvim'

" Python
Plug 'cstrap/python-snippets'

" Other Syntax
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

" --Filetypes--
au BufRead,BufNewFile *.asm set filetype=nasm

au FileType python set ts=4 sw=4 sts=4
au FileType ld,asm set ts=4 sw=4 sts=4
au FileType make   set ts=4 sw=4 noet lcs=tab:\ \ ,trail:-

" automatically rebalance windows on vim resize
au VimResized * :wincmd =

" TMUX
if &term == "screen-256color"
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif

