" Setup for pathogen plugin manager
execute pathogen#infect()
filetype plugin indent on

""""""""""
" Colors "
""""""""""
syntax on
colorscheme jerokai

"""""""""""
" Options "
"""""""""""
set number
set autoread
set showmatch
set visualbell
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set cursorline
set nowrap
set splitbelow
set splitright
set breakindent
set emoji
set wildmenu
set relativenumber
set fixendofline

""""""""""
" Remaps "
""""""""""
let mapleader=" "

imap jj <ESC>
nmap , <C-w><C-w>
imap <tab> <C-n>

" Copy relative file path to unnamed register
nmap <Leader>c :let @* = expand("%:.")<CR>

" This is so I don't accidentally scroll into oblivion
" Scrolling sends an up or down command to vim
map <up> <nop>
map <down> <nop>
imap <up> <nop>
imap <down> <nop>

nmap <Leader>t :tabedit<CR>

nmap <Leader>y "*yw
nmap <Leader>yy "*yy

nmap <Leader>r :set relativenumber<CR>
nmap <Leader>R :set norelativenumber<CR>

" Search for visual selection
vnoremap * y/<C-R>"<CR>
vnoremap # y/<C-R>"<CR>

" Repeat command in visual mode
vnoremap . :normal.<CR>

""""""""""""
" Commands "
""""""""""""

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

set colorcolumn=81
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="81,".join(range(100,999),",")

" Set columns for various screen sizes
command! ColThunder set columns=231
command! ColiMac    set columns=173
command! ColAir     set columns=123
command! ColMacBook set columns=127

" Yank entire buffer to system clipboard
command! Yall 0,$y *

"""""""""""""""""""
" Plugin-specific "
"""""""""""""""""""

" FZF fuzzy finding
set rtp+=/usr/local/opt/fzf
nmap <Leader>f :FZF<CR>

" Add matchit plugin
runtime macros/matchit.vim

nmap <Leader>n :NERDTree<CR>

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

call camelcasemotion#CreateMotionMappings('<leader>')

"""""""""""""""
" Autocorrect "
"""""""""""""""
iab credentails credentials
