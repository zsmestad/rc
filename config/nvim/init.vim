set nocompatible

filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'benekastah/neomake'
Plug 'godlygeek/tabular'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'kien/ctrlp.vim'
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

" enable syntax highlighting
filetype plugin indent on
syntax enable

" Theme
set t_Co=256
set background=dark

" Set
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set directory-=.                                             " don't store swapfiles in the current directory
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
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Keyboard
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
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
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1

let g:neomake_puppet_puppetlint_maker = { 'args': ['--no-autoloader_layout-check', '--no-80chars-check'], }

au! BufWritePost * Neomake

" Filetypes
" md is markdown
au BufRead,BufNewFile *.md set filetype=markdown

au FileType python set ts=8 et sw=4 sts=4

" automatically rebalance windows on vim resize
au VimResized * :wincmd =

" TMUX
if &term == "screen-256color"
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
endif

" Extended Text Objects
let items = [ "<bar>", "\\", "/", ":", ".", "*", "_" ]
for item in items
  exe "nnoremap yi".item." T".item."yt".item
  exe "nnoremap ya".item." F".item."yf".item
  exe "nnoremap ci".item." T".item."ct".item
  exe "nnoremap ca".item." F".item."cf".item
  exe "nnoremap di".item." T".item."dt".item
  exe "nnoremap da".item." F".item."df".item
  exe "nnoremap vi".item." T".item."vt".item
  exe "nnoremap va".item." F".item."vf".item
endfor
nnoremap viz v[zo]z$

