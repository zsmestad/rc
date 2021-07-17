set nocompatible

" https://github.com/junegunn/vim-plug/wiki/faq#conditional-activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
let g:ale_completion_enabled = 1

" --Plugins--
call plug#begin('~/.config/nvim/plugged')
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
call plug#end()

" enable syntax highlighting
syntax enable
filetype plugin indent on

lua require('settings')
lua require('maps')


" --Plugin Settings--
" Ale
set omnifunc=ale#completion#OmniFunc
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_virtualtext_cursor = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

" Deoplete
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

" VIM Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" Markdown
let g:vim_markdown_folding_disabled=1

" NERDCommenter
let g:NERDSpaceDelims=1

" NERDTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
map <C-n> :NERDTreeToggle<CR>

" Highlighted Yank
let g:highlightedyank_highlight_duration = 250

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

