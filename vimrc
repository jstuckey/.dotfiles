" Setup for pathogen plugin manager
execute pathogen#infect()
filetype plugin indent on

set columns=80
set number
syntax on
let g:rehash256 = 1 " For 256 color version of molokai
colorscheme molokai
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
nmap , <C-w><C-w>

cmap nerd NERDTree

" Copy full file path to unnamed register
nmap cp :let @* = expand("%:p")

" Re-wrap entire file
command! Wrap normal mwgggqG`w

" Trip all trailing whitespace before writing buffer
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Reload vimrc after writing to vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc

" Add spell checking for git commits
autocmd Filetype gitcommit setlocal spell

" Add matchit plugin
runtime macros/matchit.vim

" Fix window columns for various monitors
command! ColThunder set columns=231
command! ColiMac    set columns=173
