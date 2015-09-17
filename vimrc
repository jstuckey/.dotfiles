execute pathogen#infect()
filetype plugin indent on

set columns=80
set number
syntax on
colorscheme molokai
let g:rehash256 = 1 " For 256 color version of molokai
set autoread
set showmatch
set visualbell
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
set hlsearch  " highlight search
set incsearch
set cursorline
set nowrap
set splitbelow
set splitright

imap jj <ESC>
"nmap ; :
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap , <C-w><C-w>

cmap nerd NERDTree

" Copy full file path to unnamed register
nmap cp :let @* = expand("%:p")

" Re-wrap entire file
command Wrap normal gggqGgg

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()
autocmd! bufwritepost .vimrc source ~/.vimrc

" Add spell checking for git commits
autocmd Filetype gitcommit setlocal spell
