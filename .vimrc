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
nnoremap <F3> :set hlsearch!<CR>
inoremap <F3> <C-O>:set hlsearch!<CR>

"key mapping for Gundo
nnoremap <silent> <F4> :GundoToggle<CR>
inoremap <silent> <F4> <esc>:GundoToggle<CR>

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

"Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set incsearch "Incremental search
set hlsearch "Highlight search results in file

"Enable mouse support in console and set toggle button
set mouse=a
nnoremap <F12> :call ToggleMouse()<CR>
inoremap <F12> <C-O>:call ToggleMouse()<CR>
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
nnoremap <silent> <f2> :set number!<cr>
inoremap <silent> <f2> <C-O>:set number!<cr>
set number

"indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab

"Easier moving in windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

"Deal with putty
nnoremap [A <C-W>k
nnoremap [B <C-W>j
nnoremap [D <C-W>h
nnoremap [C <C-W>l
inoremap [A <C-O><C-W>k
inoremap [B <C-O><C-W>j
inoremap [D <C-O><C-W>h
inoremap [C <C-O><C-W>l

"Deal with putty and tmux
nnoremap [1;5A <C-W>k
nnoremap [1;5B <C-W>j
nnoremap [1;5D <C-W>h
nnoremap [1;5C <C-W>l
inoremap [1;5A <C-O><C-W>k
inoremap [1;5B <C-O><C-W>j
inoremap [1;5D <C-O><C-W>h
inoremap [1;5C <C-O><C-W>l

inoremap <C-J> <C-O><C-W>j
inoremap <C-K> <C-O><C-W>k
inoremap <C-L> <C-O><C-W>l
inoremap <C-H> <C-O><C-W>h
inoremap <C-Up> <C-O><C-W>k
inoremap <C-Down> <C-O><C-W>j
inoremap <C-Left> <C-O><C-W>h
inoremap <C-Right> <C-O><C-W>l

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

inoremap jj <Esc>

set ignorecase                  "case insensitive search
set smartcase                   "case sensitive when uc present
set wildmenu                    "show list instead of just completing
set wildmode=list:longest,full  "command <Tab> completion, list matches, then longest common part, then all.

"; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

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

"Alt and up/down to move lines in all modes
nnoremap <silent> [1;3B :m+<CR>==
nnoremap <silent> [1;3A :m-2<CR>==
inoremap <silent> [1;3B <Esc>:m+<CR>==gi
inoremap <silent> [1;3A <Esc>:m-2<CR>==gi
vnoremap <silent> [1;3B :m'>+<CR>gv=gv
vnoremap <silent> [1;3A :m-2<CR>gv=gv

"save file using sudo
nnoremap w :w !sudo tee % <cr>
nnoremap <A-w> :w !sudo tee % <cr>

"rainbow parentheses settings
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"rainbow parentheses binding
inoremap <silent> <F1> <C-O>:RainbowParenthesesToggle<cr>
nnoremap <silent> <F1> :RainbowParenthesesToggle<cr>

"rainbow parentheses colors
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ]

"Tagbar binding
nmap <silent> <Leader>m :TagbarToggle<CR>

"ctag bindings and settings
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags+=./tags;/
set tags+=~/.tags

"AutoTags
source ~/.vim/external/craigemery-dotFiles/vim/plugin/autotag.vim

"Paste Toggle
set pastetoggle=<F6>

"space bind
nnoremap <C-space> i
imap <C-space> <Esc>`^

nnoremap <c-@> i
imap <c-@> <Esc>`^

noremap <silent> o :put =''<CR>
noremap <silent> O :put! =''<CR>

"different bacground in insert mode
"au InsertEnter * :call ToggleBackground()
"au InsertLeave * :call ToggleBackground()
"function! ToggleBackground()
"    if &background == 'dark'
"        set background=light
"    else
"        set background=dark
"    endif
"endfunction

"disable automatic commenting on new line (not sure why that is a thing)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" after yanking in visual mode I want to be at the end of the selection, not the beginning
function! YRRunAfterMaps()
    vmap y ygv<Esc>
endfunction
