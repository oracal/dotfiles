source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Change mapleader
let mapleader=","

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>

"color scheme
set t_Co=256
syntax on
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

"line numbers
nmap <f2> :aset number! number?<cr>
set number

"indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"Easier moving in windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-Up> <C-W>k
map <C-Down> <C-W>j
map <C-Left> <C-W>h
map <C-Right> <C-W>l

"key mappings for saving file
nmap <C-s> :w<CR>
vmap <C-s> <C-C>:w<CR>
imap <C-s> <C-O>:w<CR>

set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.

"; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
noremap ; :
