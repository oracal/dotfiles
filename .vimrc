source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"Use Vim settings, rather then Vi settings
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Change mapleader
let mapleader=","

"nerd tree binding
nmap <silent> <Leader>, :NERDTreeToggle<CR>

"ctrlp binding
nmap <silent> <Leader>. :CtrlPMixed<CR>

"remove highlighting for search
nnoremap <silent> <F3> :set hlsearch!<CR>

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>

"color scheme
set t_Co=256
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

set noerrorbells "No error bells

set incsearch "Incremental search
set hlsearch "Highlight search results in file

"Enable mouse support in console
set mouse=a

"line numbers
nmap <f2> :set number! number?<cr>
set number

"indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab


"Easier moving in windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-Up> <C-W>k
map <C-Down> <C-W>j
map <C-Left> <C-W>h
map <C-Right> <C-W>l

"Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

"key mappings for saving file
nmap <C-s> :w<CR>
vmap <C-s> <C-C>:w<CR>
imap <C-s> <C-O>:w<CR>

set ignorecase                  "case insensitive search
set smartcase                   "case sensitive when uc present
set wildmenu                    "show list instead of just completing
set wildmode=list:longest,full  "command <Tab> completion, list matches, then longest common part, then all.

"; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
noremap ; :

"This shows what you are typing as a command.
set showcmd

"Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

"Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
