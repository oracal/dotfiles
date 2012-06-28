source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
set t_Co=256
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")
nmap <f2> :set number! number?<cr>
set number
set tabstop=4
set shiftwidth=4
