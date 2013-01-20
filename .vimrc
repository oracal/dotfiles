" ---- plugin management ----

source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" ---- vim settings ----

" color scheme
set t_Co=256
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set background=dark
colorscheme solarized

set noerrorbells "No error bells
set novisualbell
set t_vb=
set tm=500

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set incsearch "Incremental search
set hlsearch "Highlight search results in file

" indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype jade setlocal ts=2 sts=2 sw=2
autocmd Filetype jst setlocal ts=2 sts=2 sw=2

" Use Vim settings, rather then Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ignorecase                  "case insensitive search
set smartcase                   "case sensitive when uc present
set wildmenu                    "show list instead of just completing
set wildmode=list:longest,full  "command <Tab> completion, list matches, then longest common part, then all.

" This shows what you are typing as a command.
set showcmd

"store lots of :cmdline history
set history=1000

set tags+=./tags;/

" edit solarized slightly for less harsh colors
set fillchars+=vert:\│
hi VertSplit ctermbg=8 ctermfg=11
hi SignColumn ctermbg=8 ctermfg=11
hi StatusLineNC ctermbg=0 ctermfg=0 cterm=NONE
hi StatusLine ctermbg=0 ctermfg=0

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile
endif

set scrolloff=5

nnoremap H H5k
nnoremap L L5j

vnoremap H H5k
vnoremap L L5j

" ---- plugin settings ----

" rainbow parentheses settings
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" rainbow parentheses colors
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

" Powerline configuration
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'oracal'
let g:Powerline_colorscheme = 'oracal'

" Syntastic configuration
let g:syntastic_enable_balloons = 0

let g:slime_target = "tmux"
let g:slime_paste_file = "~/.slime_paste"

" AutoTags
let g:autotagmaxTagsFileSize = 200*1024*1024
source ~/.vim/external/craigemery-dotFiles/vim/plugin/autotag.vim

let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snipmate"]

" let g:SuperTabDefaultCompletionType = "context"

" space bind
nnoremap <C-space> i
inoremap <C-space> <Esc>`^

nnoremap <c-@> i
inoremap <c-@> <Esc>`^

" ---- leader mappings ----

" Change mapleader
let mapleader=","

let g:EasyMotion_leader_key = '<leader><leader>'

" nerd tree binding
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" ctrlp binding
nnoremap <silent> <Leader>p :CtrlPMixed<CR>

" key mapping for Gundo
nnoremap <silent> <leader>g :GundoToggle<CR>

" Tagbar binding
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" Yankring mapping
nnoremap <silent> <leader>y :YRShow<CR>

" save file using sudo
nnoremap <leader>s :w !sudo tee % >/dev/null<CR>

" vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxClosePanes<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>

" ---- function key mappings ----

" rainbow parentheses binding
inoremap <silent> <F1> <C-O>:RainbowParenthesesToggle<cr>
nnoremap <silent> <F1> :RainbowParenthesesToggle<cr>

" line numbers
nnoremap <silent> <F2> :set number!<cr>
inoremap <silent> <F2> <C-O>:set number!<cr>
set number

" remove highlighting for search
nnoremap <F3> :set hlsearch!<CR>
inoremap <F3> <C-O>:set hlsearch!<CR>

" Paste Toggle
set pastetoggle=<F6>

" Enable mouse support in console and set toggle button
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

" ---- window mappings ----

" Easier moving in windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

" Deal with putty
nnoremap [A <C-W>k
nnoremap [B <C-W>j
nnoremap [D <C-W>h
nnoremap [C <C-W>l
inoremap [A <C-O><C-W>k
inoremap [B <C-O><C-W>j
inoremap [D <C-O><C-W>h
inoremap [C <C-O><C-W>l

" Deal with putty and tmux
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

" set the shift arrows to change the size of vim windows
nnoremap <silent> [1;2A :call Resize('+')<cr>
nnoremap <silent> [1;2B :call Resize('-')<cr>
nnoremap <silent> [1;2D :call Resize('<')<cr>
nnoremap <silent> [1;2C :call Resize('>')<cr>

inoremap <silent> [1;2A <c-o>:call Resize('+')<cr>
inoremap <silent> [1;2B <c-o>:call Resize('-')<cr>
inoremap <silent> [1;2D <c-o>:call Resize('<')<cr>
inoremap <silent> [1;2C <c-o>:call Resize('>')<cr>

" function to resize vim windows with arrows taking into account window position
function! Resize(dir)
    let rightest = 0
    let leftest = 0
    let top = 0
    let bottom = 0
    let down1 = 0
    let down2 = 0
    let right1 = 0
    let right2 = 0
    let this = winnr()
    if '+' == a:dir || '-' == a:dir
        execute "normal \<c-w>k"
        let up = winnr()
        exe this . "wincmd w"
        execute "normal \<c-w>j"
        let down1 = winnr()
        execute "normal \<c-w>j"
        let down2 = winnr()
        exe this . "wincmd w"
        if up == this
            let top = 1
        endif
        if down1 == this
            let bottom = 1
        endif
    elseif '>' == a:dir || '<' == a:dir
        execute "normal \<c-w>h"
        let left = winnr()
        exe this . "wincmd w"
        execute "normal \<c-w>l"
        let right1 = winnr()
        execute "normal \<c-w>l"
        let right2 = winnr()
        exe this . "wincmd w"
        if left == this
            let leftest = 1
        endif
        if right1 == this
            let rightest = 1
        endif
    endif

    if ('+' == a:dir && bottom == 1) || ('-' == a:dir && top == 1)
        execute "normal \<c-w>+"
    endif
    if ('-' == a:dir && bottom == 1) || ('+' == a:dir && top == 1)
        execute "normal \<c-w>-"
    endif
    if ('<' == a:dir && leftest == 1) || ('>' == a:dir && rightest == 1)
        execute "normal \<c-w><"
    endif
    if ('>' == a:dir && leftest == 1) || ('<' == a:dir && rightest == 1)
        execute "normal \<c-w>>"
    endif
    if (('<' == a:dir || '>' == a:dir) && leftest == 0 && rightest == 0)
        if (right1 == right2)
            if ('<' == a:dir)
                execute "normal \<c-w>l\<c-w>>"
            else
                execute "normal \<c-w>l\<c-w><"
            endif
            exe this . "wincmd w"
        else
            execute "normal \<c-w>" . a:dir
        endif
    endif
    if (('+' == a:dir || '-' == a:dir) && bottom == 0 && top == 0)
        execute "normal \<c-w>j\<c-w>" . a:dir
        exe this . "wincmd w"
    endif
endfunction

" ---- other mappings ----

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
" nnoremap <silent> <Up> gk
" nnoremap <silent> <Down> gj
" inoremap <silent> <Up> <Esc>gka
" inoremap <silent> <Down> <Esc>gja

" disble arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" key mappings for saving file
nmap <C-s> :w<CR>
vmap <C-s> <C-C>:w<CR>
imap <C-s> <C-O>:w<CR>

" Remap jj and jk to esc and set esc to nop
inoremap jj <Esc>`^
inoremap jk <Esc>`^
inoremap <Esc> <nop>

" ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :
nnoremap q; q:

" leader and j/k to move lines in all modes (others)
nnoremap <silent> <leader>j :m+<CR>==
nnoremap <silent> <leader>k :m-2<CR>==
inoremap <silent> <leader>j <Esc>:m+<CR>==gi
inoremap <silent> <leader>k <Esc>:m-2<CR>==gi
vnoremap <silent> <leader>j :m'>+<CR>gv=gv
vnoremap <silent> <leader>k :m-2<CR>gv=gv

" Alt and up/down to move lines in all modes
nnoremap <silent> [1;3B :m+<CR>==
nnoremap <silent> [1;3A :m-2<CR>==
inoremap <silent> [1;3B <Esc>:m+<CR>==gi
inoremap <silent> [1;3A <Esc>:m-2<CR>==gi
vnoremap <silent> [1;3B :m'>+<CR>gv=gv
vnoremap <silent> [1;3A :m-2<CR>gv=gv

" ctag mappings
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" after yanking in visual mode I want to be where I was previously (seems quite slow)
function! YRRunAfterMaps()
    " vmap y ygv<Esc>
    " map p gp
    " map P gP
endfunction

" after yanking in visual mode I want to be at the end of the selection, not the beginning (much faster but not as good)
" function! YRRunAfterMaps()
"    vmap y y'>
" endfunction

" ctrl - a is my multiplexing prefix
map <C-a> <nop>

" noremap <silent> o :put =''<CR>
" noremap <silent> O :put! =''<CR>

" ------ other plugin mappings ------

" mappings for swapit and speeddating
let g:speeddating_no_mappings = 1
nnoremap <silent><c-q> :<c-u>call SwapWord(expand("<cword>"),'forward', 'no')<cr>
noremap <silent><c-x> :<c-u>call SwapWord(expand("<cword>"),'backward','no')<cr>
vnoremap <silent><c-q> "dy:call SwapWord(@d,'forward','yes')<cr>
noremap <silent><c-x> "dy:call SwapWord(@d,'backward','yes')<cr>

nmap d<C-q> <Plug>SpeedDatingNowUTC
nmap d<C-x> <Plug>SpeedDatingNowLocal

" swapit fallbacks to speeddating if no match
nmap <Plug>SwapItFallbackIncrement <Plug>SpeedDatingUp
nmap <Plug>SwapItFallbackDecrement <Plug>SpeedDatingDown
vmap <Plug>SwapItFallbackIncrement <Plug>SpeedDatingUp
vmap <Plug>SwapItFallbackDecrement <Plug>SpeedDatingDown

" ---- auto commands ----

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif

" disable automatic commenting on new line (not sure why that is a thing)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
