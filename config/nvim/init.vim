set nocompatible

filetype off

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

" Comments and Quotes
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Change path to git root
Plug 'airblade/vim-rooter'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Lint
Plug 'w0rp/ale'

" Completion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh'
  \ }

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Puppet
Plug 'rodjek/vim-puppet'

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
filetype plugin indent on
syntax enable

" Turn off mouse
set mouse=

" Theme
set t_Co=256
set background=dark

" --Options--
set encoding=utf-8

" Indentation
set autoindent
set backspace=2
set expandtab
set scrolloff=3
set shiftwidth=2
set softtabstop=2
set tabstop=4

set autoread
set directory=~/.local/tmp
set foldmethod=marker
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:-
set pastetoggle=<F2>
set ruler
set showcmd
set smartcase

set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.o,*.obj,.git,bower_components/**,**/node_modules/**,_build/**,deps/**
set wildmenu
set wildmode=longest,list,full

" --Keyboard--

" Move easily between windows
" iTerm2 issue: Set ^h to send escape code '[104;5u'
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader = ','

nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

nmap <leader>F :FZF<CR>

map <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

" Handle git (three-way) diffs more easily
if &diff
  map <leader>1 :diffget LOCAL<CR>
  map <leader>2 :diffget BASE<CR>
  map <leader>3 :diffget REMOTE<CR>
endif

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

"" Language Client
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  \ 'python': ['~/.pyenv/shims/pyls'],
  \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio']
  \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"" VIM Airline
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

