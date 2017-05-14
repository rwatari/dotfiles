" Vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'KeitaNakamura/neodark.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" Neodark settings
colorscheme neodark
let g:neodark#use_custom_terminal_theme = 1 " default: 0
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'

" Enable syntax highlighting
if !exists("g:syntax_on")
    syntax enable
else
    syntax on
endif

" Other settings
set number                   " Line numbers!!
set relativenumber
set laststatus=2             " Set status bar on (for lightline)
set noshowmode               " Get rid of status below lightline
set tabstop=4 shiftwidth=4   " Set tab width to 4
set ttimeoutlen=50           " Eliminate esc key lag
set showcmd                  " Show vim commands
