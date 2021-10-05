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

" Gitsigns dependency
Plug 'nvim-lua/plenary.nvim'

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

" Lint
Plug 'dense-analysis/ale'

" Completion
Plug 'Shougo/deoplete.nvim'

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
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Misc FT
Plug 'LnL7/vim-nix'

call plug#end()

" enable syntax highlighting
syntax enable
filetype plugin indent on

lua require('settings')
lua require('maps')

" --Plugin Settings--
lua require('plugins')

" Ale (no idea about the lua for these)
set omnifunc=ale#completion#OmniFunc
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

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

