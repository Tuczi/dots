" Install vundle from here first: https://github.com/VundleVim/Vundle.vim
" Then run in vim command :PluginInstall
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" ADD PLUGINS HERE
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required


" ADD OTHER SETTING HERE
syntax enable
set relativenumber
set number
set ruler

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cindent

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status bar
set laststatus=2

set noequalalways

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set mouse=a
set ttymouse=xterm
set ttyscroll=10
set ttyfast

" Colors & Solarized plugin settings
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
