execute pathogen#infect()

let g:ycm_confirm_extra_conf = "~/.vim/.ycm_extra_conf.py"
se nocompatible

set relativenumber
set ruler
syntax on

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

set noequalalways

let g:CommandTMaxHeight=20

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType haskell,c,xc,cpp,java,php,ruby,python,javascript,slim,sass,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Use modeline overrides
set modeline
set modelines=10

"rectories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" Show (partial) command in the status line
set showcmd

map <leader>c <c-_><c-_>

let c_no_curly_error=1

let python_highlight_all = 1

" ruby require 'maclight'
" ruby MacLight.capslock false

" au InsertEnter * ruby MacLight.capslock true
" au InsertLeave,VimLeave * ruby MacLight.capslock false

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=darkgreen
  elseif a:mode == 'r'
    hi statusline ctermfg=magenta
  else
    hi statusline ctermfg=black
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=black

set noshowmode
set autoindent
set splitbelow
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_min_num_of_chars_for_completion=2
" let g:ycm_show_diagnostics_ui=0
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_semantic_triggers = {'haskell' : ['.']}
" let g:ghcmod_ghc_options = ['-w']
" let g:ghcmod_hlint_options = ['--ignore=Reduntant $']
 let g:ycm_key_invoke_completion = '<C-Space>'

autocmd FocusLost * :set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd CursorMoved * :set relativenumber
au BufNewFile,BufRead *.xc set filetype=xc
set printfont=PragmataPro
set printencoding=utf-8
set t_ZH=[3m
set t_ZR=[23m
nnoremap ; :
cmap w!! w !sudo tee % >/dev/null
nnoremap <silent> <Leader>\ :CommandT<CR>
nmap <silent> <Leader>\d <Plug>DashSearch
nnoremap <silent> <Leader>t :TagbarOpenAutoClose<CR>
nnoremap <silent> <Leader>f :%!astyle --style=google --indent=spaces=2 --indent-switches --break-blocks --pad-header --align-pointer=type --align-reference=name --keep-one-line-statements --suffix=none --quiet --indent-classes --indent-namespaces<CR>
nnoremap <silent> <Leader>ss :/<CR>
nnoremap <silent> <Leader>a :A<CR>
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxHeight=5
let g:EasyGrepRecursive=0
let g:EasyGrepCommand=1
let g:EasyGrepMode=0
let g:EasyGrepIgnoreCase=0
let g:EasyGrepFilesToExclude=".svn,.git,docs/html,*.o,*.obj"
let g:EasyGrepJumpToMatch=0
let g:EasyGrepExtraWarnings=0
let g:EasyGrepSearchCurrentBufferDir=1

set nofoldenable


set ttyscroll=10
set lazyredraw


let g:startify_skiplist = [
           \ 'COMMIT_EDITMSG',
           \ $VIMRUNTIME .'/doc',
           \ 'bundle/.*/doc',
           \ '\.DS_Store',
           \ 'docs/html/*'
           \ ]


set mouse=a
set ttymouse=xterm
set ttyscroll=10
set ttyfast
"map <ScrollWheelUp> <C-Y> <C-Y>
"map <ScrollWheelDown> <C-E> <C-E>
set wildignore+=*.o,*.obj,.git,docs/html,.DS_Store,*.so,*.dylib
autocmd Syntax * syn match cTodo /@todo([^"]*)\|@todo\|todo:\|todo([^"]*):\|TODO/
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:html_use_css = 1

let g:solarized_termcolors=256
set background=dark

if has("gui_running")
  set background=light
  set guifont=PragmataPro:h14
  set printfont=PragmataPro:h11
  set guioptions=aAce
  set columns=84
  set lines=40
endif

let g:vim_markdown_folding_disabled=1

colorscheme solarized
set number
au BufNewFile,BufRead *.txt set filetype=markdown
