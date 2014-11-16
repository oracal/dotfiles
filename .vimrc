" Use Vim settings, rather then Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" plugin management

source ~/.vim/bundle/vim-plug/plug.vim
call plug#begin('~/.vim/bundle')

" language
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-bundler'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-git'
Plug 'sheerun/vim-polyglot'
Plug 'tangledhelix/vim-octopress'
Plug 'briancollins/vim-jst'
Plug 'vhdirk/vim-cmake'
Plug 'uarun/vim-protobuf'

" completion
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'

" code display
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'flazz/vim-colorschemes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Yggdroot/indentLine'

" git integrations
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'int3/vim-extradite'

" tmux integrations
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-tbone'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'wellle/tmux-complete.vim'

" other integrations
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-dispatch'
Plug 'jmcantrell/vim-virtualenv'
Plug 'tpope/vim-eunuch'

" interface
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'edkolev/tmuxline.vim'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-vinegar'

" text-object
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-indent'
Plug 'michaeljsmith/vim-indent-object'
Plug 'bkad/CamelCaseMotion'

" movement
Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tmhedberg/matchit'
Plug 'voithos/vim-python-matchit'

" manipulation
Plug 'godlygeek/tabular'
Plug 'vim-scripts/Align'
Plug 'tomtom/tcomment_vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mjbrownie/swapit'
Plug 'AndrewRadev/switch.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'PeterRincker/vim-argumentative'
Plug 'tpope/vim-speeddating'
Plug 'sk1418/Join'

" commands
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-expand-region'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-rsi'
Plug 'vim-scripts/a.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'jaxbot/selective-undo.vim'

" other
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-characterize'
Plug 'kana/vim-altr'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" vim settings

" colorscheme
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set fillchars+=vert:\|

" hybrid theme
colorscheme hybrid
let g:indentLine_color_term = 237
let g:indentLine_color_gui = '#373b41'

" " solarized theme
" colorscheme solarized
" set background=dark
" hi VertSplit ctermbg=8 ctermfg=11
" hi SignColumn ctermbg=8 ctermfg=11
" hi StatusLineNC ctermbg=0 ctermfg=0 cterm=NONE
" hi StatusLine ctermbg=0 ctermfg=0

set noerrorbells
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

set hlsearch "Highlight search results in file

" indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" filetype indent settings
autocmd Filetype c,cpp,python,rust setlocal ts=4 sts=4 sw=4

" set filetype of cmake files
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

" cindent options

" no indent after private:, public: and protected:
set cino+=g0
" no indent after namespaces
set cino+=N-s

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ignorecase                  "case insensitive search
set smartcase                   "case sensitive when uc present
set wildmode=list:longest,full  "command <Tab> completion, list matches, then longest common part, then all.
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__

set tags+=./tags;/

"undo settings
set undodir=~/.vim/undofiles
set undofile

set scrolloff=5

nnoremap H H5k
nnoremap L L5j

vnoremap H H5k
vnoremap L L5j

" delete comment characters when joining commented lines with J
silent! set formatoptions+=j

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

" highlight current line
set cursorline

" Set command line height (default)
set cmdheight=1

" expand %% to current directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" Optimize for fast terminal connections
set ttyfast

" Time out on key codes but not mappings
set notimeout

" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256

" Don't syntax highlight long lines
set synmaxcol=256

let g:matchparen_insert_timeout = 5

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

nnoremap Q <nop>

" gvim settings
set guioptions-=m " menu bar
set guioptions-=T " toolbar
set guioptions-=r " scrollbar
set guioptions-=L " other scrollbar
set guifont=Literation\ Mono\ Powerline

" plugin settings

" rainbow parentheses settings
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" buffergator settings
let g:buffergator_suppress_keymaps = 1

" status line config
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_preset = {
      \'a'       : '#S',
      \'b'       : ['#I:#P'],
      \'win'     : ['#I:#W'],
      \'cwin'    : ['#I:#W'],
      \'y'       : '%H:%M %d-%b-%y'}

" Syntastic configuration
let g:syntastic_enable_balloons = 0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['rust'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1

let g:slime_target = "tmux"
let g:slime_paste_file = "~/.slime_paste"
let g:slime_no_mappings = 1

" space bind
nnoremap <C-space> i
inoremap <C-space> <Esc>`^

nnoremap <c-@> i
inoremap <c-@> <Esc>`^

" vim-expand-region
" Use the global default + the following for ruby
call expand_region#custom_text_objects('ruby', {
      \ 'im' :0,
      \ 'am' :0,
      \ })

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" vim-octopress
autocmd BufNewFile,BufRead *.markdown,*.textile set filetype=octopress

" disable delimitmate for vim files
let delimitMate_excluded_ft = "vim,rust"
" move closing bracket one line down when <cr>
let delimitMate_expand_cr = 1

" indentline settings
let g:indentLine_fileType = []
let g:indentLine_fileTypeExclude = []

" use vineger/netrw rather than nerdtree for opening folders
let g:NERDTreeHijackNetrw = 0

" leader mappings

" Change mapleader
let mapleader = ","
noremap \ ,

" current syntax group under cursor
nnoremap <leader>sg :echo synIDattr(synID(line("."),col("."),1),"name")<CR>

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

" vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxClosePanes<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>

" vim-slime
xmap <leader>a <Plug>SlimeRegionSend
nmap <leader>a <Plug>SlimeMotionSend
nmap <leader>aa <Plug>SlimeLineSend
nmap <leader>ac <Plug>SlimeConfig

" map Dispatch to avoid having to press enter twice and since it is used quite a bit.
noremap <silent> <leader>m :Dispatch<CR>
" ignore warning messages when running :make > quickfix
set errorformat^=%-G%f:%l:\ warning:%m

" toggle spell check
nnoremap <silent> <leader>c :set spell!<CR>

" function key mappings

" rainbow parentheses binding
inoremap <silent> <F1> <C-O>:RainbowParenthesesToggle<cr>
nnoremap <silent> <F1> :RainbowParenthesesToggle<cr>

" line numbers
nnoremap <silent> <F2> :set number!<cr>
inoremap <silent> <F2> <C-O>:set number!<cr>
set number

" remove highlighting for search
nnoremap <silent> <F3> :<C-u>nohlsearch<CR>
inoremap <silent> <F3> <C-O>:<C-u>nohlsearch<CR>

" Paste Toggle
set pastetoggle=<F6>

" other mappings

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> gk k
nnoremap <silent> j gj
nnoremap <silent> gj j
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
nnoremap <silent> g<Up> k
nnoremap <silent> g<Down> j

" same but in visual mode
xnoremap <silent> k gk
xnoremap <silent> gk k
xnoremap <silent> j gj
xnoremap <silent> gj j
xnoremap <silent> <Up> gk
xnoremap <silent> <Down> gj
xnoremap <silent> g<Up> k
xnoremap <silent> g<Down> j

" key mappings for saving file
nnoremap <C-s> :w<CR>

" Remap jj and jk to esc
inoremap jj <Esc>`^
inoremap jk <Esc>`^

" ctag mappings
noremap <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" make the tselect list the default when opening tags (too many similar named classes and methods in my projects and
" ctags does not seem to care too much about namespaces)
noremap <C-]> g<C-]>
noremap g<C-]> <C-]>

" ctrl - a is my multiplexing prefix
noremap <C-a> <nop>

" use up and down in the ex command line without leaving home row
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" key mappings that need to occur after yankrings
function! YRRunAfterMaps()
  " yanking and pasting now leave the cursor at the end of the selection
  vnoremap <silent> y y`]
  vnoremap <silent> p p`]
  nnoremap <silent> p p`]

  " this pisses me off so much D is d$ C is c$ A is $a but Y is yy. WHY?
  noremap Y y$

  " Make cw behave like dw and yw
  onoremap <silent> w :execute 'normal! '.v:count1.'w'<CR>

  "replace 'f' with inclusive 1-char Sneak
  nmap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  xmap f <Plug>Sneak_f
  xmap F <Plug>Sneak_F
  omap f <Plug>Sneak_f
  omap F <Plug>Sneak_F

  "replace 't' with exclusive 1-char Sneak
  nmap t <Plug>Sneak_t
  nmap T <Plug>Sneak_T
  xmap t <Plug>Sneak_t
  xmap T <Plug>Sneak_T
  omap t <Plug>Sneak_t
  omap T <Plug>Sneak_T
endfunction

" other plugin mappings

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

" auto commands

" Automatically cd into the directory that the file is in
autocmd BufEnter * silent! lcd %:p:h

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" disable automatic commenting on new line (not sure why that is a thing)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" close vim if the only buffer left is nerdtree (taken from https://github.com/scrooloose/nerdtree/issues/21)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" close vim if the only buffer left is quickfix
autocmd bufenter * if winnr('$') == 1 && &buftype == 'quickfix' | quit | endif
