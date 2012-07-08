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
set novisualbell
set t_vb=
set tm=500

"Don't redraw while executing macros (good performance config)
set lazyredraw

"Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set incsearch "Incremental search
set hlsearch "Highlight search results in file

"Enable mouse support in console and set toggle button
set mouse=a
nnoremap <F12> :call ToggleMouse()<CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        echo "Mouse usage disabled"
    else
        set mouse=a
        echo "Mouse usage enabled"
    endif
endfunction

"line numbers
nnoremap <f2> :set number!<cr>
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
"nnoremap <silent> k gk
"nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

"key mappings for saving file
nmap <C-s> :w<CR>
vmap <C-s> <C-C>:w<CR>
imap <C-s> <C-O>:w<CR>

inoremap jj <Esc>

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

"Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif

"Alt and j/k to move lines in all modes (xterm)
nnoremap <silent> j :m+<CR>==
nnoremap <silent> k :m-2<CR>==
inoremap <silent> j <Esc>:m+<CR>==gi
inoremap <silent> k <Esc>:m-2<CR>==gi
vnoremap <silent> j :m'>+<CR>gv=gv
vnoremap <silent> k :m-2<CR>gv=gv

"Alt and j/k to move lines in all modes (others)
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==
inoremap <silent> <A-j> <Esc>:m+<CR>==gi
inoremap <silent> <A-k> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-j> :m'>+<CR>gv=gv
vnoremap <silent> <A-k> :m-2<CR>gv=gv

"Alt and up/down to move lines in all modes
nnoremap <silent> <A-Down> :m+<CR>==
nnoremap <silent> <A-Up> :m-2<CR>==
inoremap <silent> <A-Down> <Esc>:m+<CR>==gi
inoremap <silent> <A-Up> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-Down> :m'>+<CR>gv=gv
vnoremap <silent> <A-Up> :m-2<CR>gv=gv
