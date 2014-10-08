execute pathogen#infect()
filetype plugin indent on

autocmd! bufwritepost .vimrc source ~/.vimrc
set number
syntax on
colorscheme vividchalk
set autoread
set showmatch
set visualbell
set hlsearch
set smartindent
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
