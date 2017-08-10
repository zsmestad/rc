set nocompatible

filetype off

" https://github.com/junegunn/vim-plug/wiki/faq#conditional-activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'benekastah/neomake'
Plug 'godlygeek/tabular'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

" Language Server Protocol (LSP)
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp', { 'branch': 'dev' }
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Markdown
Plug 'junegunn/vim-xmark', Cond(has('mac'), { 'do': 'make', 'for': 'markdown' })
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Rust
Plug 'rust-lang/rust.vim'
call plug#end()

" enable syntax highlighting
filetype plugin indent on
syntax enable

" Turn off mouse
set mouse=

" Theme
set t_Co=256
set background=dark

" Set
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set directory=~/tmp                                          " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set foldmethod=marker
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:-
set pastetoggle=<F2>
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 4 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.o,*.obj,.git,bower_components/**,**/node_modules/**,_build/**,deps/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Keyboard

" Move easily between windows
" iTerm2 issue: Set ^h to send escape code '[104;5u'
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader = ','

nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

map <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

" Handle git (three-way) diffs more easily
if &diff
  map <leader>1 :diffget LOCAL<CR>
  map <leader>2 :diffget BASE<CR>
  map <leader>3 :diffget REMOTE<CR>
endif

" Plugins
let g:deoplete#enable_at_startup = 1

if executable('rls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'rls',
    \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
    \ 'whitelist': ['rust'],
    \ })
endif

if executable('pyls')
  " pip install python-language-server
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif

let g:rustfmt_autosave = 0
let g:ctrlp_match_window = 'order:ttb,max:20'

let g:NERDSpaceDelims=1

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

let g:neomake_ruby_rubocop_maker = { 'args': ['--display-cop-names', '--extra-details'] }
let g:neomake_python_pylint_maker = { 'args': ['--max-line-length=120'] }

let g:vim_markdown_folding_disabled=1

au! BufWritePost * Neomake

" Filetypes
au BufRead,BufNewFile *.asm set filetype=nasm

au FileType python set ts=4 sw=4 sts=4
au FileType ld,asm set ts=4 sw=4 sts=4
au FileType make   set ts=4 sw=4 noet lcs=tab:\ \ ,trail:-

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" automatically rebalance windows on vim resize
au VimResized * :wincmd =

" TMUX
if &term == "screen-256color"
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif

" VIM Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

