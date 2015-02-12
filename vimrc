execute pathogen#infect()
filetype plugin indent on

set columns=80
set number
syntax on
colorscheme vividchalk
set autoread
set showmatch
set visualbell
set hlsearch
set smartindent
set shiftwidth=2
set softtabstop=2
set autoindent
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
set hlsearch  " highlight search
set incsearch

imap jj <ESC>
nmap ; :
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()
autocmd! bufwritepost .vimrc source ~/.vimrc
