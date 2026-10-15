" Setup for pathogen plugin manager
execute pathogen#infect()
filetype plugin indent on

""""""""""
" Colors "
""""""""""
syntax on
set re=0 " disable slow syntax regex
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
set complete=.,w,b,u,i
set directory^=$HOME/.vim/swap//

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

" Yank entire buffer to system clipboard
command! Yall 0,$y *

"""""""""""""""""""
" Plugin-specific "
"""""""""""""""""""

" FZF fuzzy finding
set rtp+=/opt/homebrew/opt/fzf
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
iab cateogry category

"""""""""""""""""""""""
" Open file in GitHub "
"""""""""""""""""""""""

function! OpenLineOnGitHub() range abort
  " Repo root and the current file's path relative to it
  let l:root = trim(system('git -C ' . shellescape(expand('%:p:h')) . ' rev-parse --show-toplevel'))
  if v:shell_error
    echoerr 'Not inside a git repository'
    return
  endif
  let l:relpath = substitute(expand('%:p'), '^' . escape(l:root, '/\') . '/', '', '')

  " Parse the origin remote into a github repo path (handles ssh + https forms)
  let l:remote = trim(system('git -C ' . shellescape(l:root) . ' remote get-url origin'))
  let l:repo = substitute(l:remote, '^.*github\.com[:/]', '', '')
  let l:repo = substitute(l:repo, '\.git$', '', '')

  " a:firstline == a:lastline in normal mode; they span the selection in visual mode
  let l:anchor = '#L' . a:firstline
  if a:lastline != a:firstline
    let l:anchor .= '-L' . a:lastline
  endif

  let l:url = 'https://github.com/' . l:repo . '/blob/master/' . l:relpath . l:anchor

  call system('open ' . shellescape(l:url))
  echo l:url
endfunction

nnoremap <silent> <leader>gh :call OpenLineOnGitHub()<CR>
xnoremap <silent> <leader>gh :call OpenLineOnGitHub()<CR>

"""""""""""""""""""""
" Prettier autosave "
"""""""""""""""""""""
let g:prettier#autoformat = 0

augroup Prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css Prettier
augroup END
