set nocompatible

" Vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'rwatari/neodark.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'           " Git integration for vim
Plug 'tpope/vim-sleuth'             " Sets tab sizes automatically
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Neodark settings
colorscheme neodark
let g:neodark#use_custom_terminal_theme = 1 " default: 0
let g:lightline = {
            \ 'colorscheme': 'neodark',
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'readonly', 'fugitive', 'filename', 'modified' ]
            \   ]
            \ },
            \ 'component': {
            \   'lineinfo': ' %3l:%-2v',
            \ },
            \ 'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'fugitive': 'LightlineFugitive'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

hi EndOfBuffer ctermbg=200 ctermfg=200 guifg=#263A45 guibg=#263A45

" Enable syntax highlighting
if !exists("g:syntax_on")
    syntax enable
else
    syntax on
endif

" Key remaps
nnoremap j gj                " Allow vertical navigation on wrapped text
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
let mapleader="\\"
map <Space> <Leader>
nnoremap <Leader>s :source $MYVIMRC<CR> :noh<CR>
nnoremap <Leader>c 0vg_y     " select current line without newline
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

" Other settings
set number                   " Line numbers!!
set relativenumber
set laststatus=2             " Set status bar on (for lightline)
set noshowmode               " Get rid of status below lightline
set cursorline               " Highlight line cursor is on
let &colorcolumn=join(range(101,256),",")           " Show margin on line 80
set showcmd                  " Show vim commands
set scrolloff=5              " Scroll buffer for top and bottom
set mouse=a
set clipboard=unnamed        " Enable copying to system clipboard
set wildmenu                 " Enable tab-completion menu
set lazyredraw               " fix slow j/k navigation
set backspace=indent,eol,start
set timeoutlen=500           " Set leader timeout
set ttimeoutlen=0            " Allow esc to exit insert mode immediately

" Cursor stuff
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Search
set incsearch
set hlsearch
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
set ignorecase
set smartcase

" netrw
let g:netrw_preview=1       " allow preview mode
let g:netrw_banner=0        " remove banner
let g:netrw_liststyle=3     " tree view
