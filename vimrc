execute pathogen#infect()
filetype plugin indent on

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

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()
autocmd! bufwritepost .vimrc source ~/.vimrc
