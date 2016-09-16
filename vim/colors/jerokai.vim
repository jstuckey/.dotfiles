" Vim color file
"
" Author: Jeremy Stuckey <jeremystuckey@gmail.com>
"
" Note: Based on Tomas Restrepo's molokai.vim theme
"

hi clear

let g:colors_name="jerokai"

"
" Support for 256-color terminal
"
hi Boolean         ctermfg=141
hi Character       ctermfg=222
hi ColorColumn     ctermbg=236
hi Comment         ctermfg=244
hi Conditional     ctermfg=197                 cterm=bold
hi Constant        ctermfg=141                 cterm=bold
hi CursorColumn    ctermbg=236
hi CursorLine      ctermbg=237   cterm=none
hi CursorLineNr    ctermfg=208                 cterm=none
hi Cursor          ctermfg=16    ctermbg=253
hi Debug           ctermfg=225                 cterm=bold
hi Define          ctermfg=81
hi Delimiter       ctermfg=241
hi DiffAdd                       ctermbg=24
hi DiffChange      ctermfg=181   ctermbg=239
hi DiffDelete      ctermfg=125   ctermbg=233
hi DiffText                      ctermbg=102   cterm=bold
hi Directory       ctermfg=154                 cterm=bold
hi Error           ctermfg=222   ctermbg=233
hi ErrorMsg        ctermfg=199   ctermbg=16    cterm=bold
hi Exception       ctermfg=154                 cterm=bold
hi Float           ctermfg=141
hi Folded          ctermfg=67    ctermbg=16
hi FoldColumn      ctermfg=67    ctermbg=16
hi Function        ctermfg=154
hi Identifier      ctermfg=208
hi Ignore          ctermfg=244   ctermbg=232
hi IncSearch       ctermfg=193   ctermbg=16
hi Keyword         ctermfg=197                 cterm=bold
hi Label           ctermfg=229                 cterm=none
hi LineNr          ctermfg=245   ctermbg=237
hi Macro           ctermfg=193
hi MatchParen      ctermfg=233   ctermbg=208   cterm=bold
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229
hi NonText         ctermfg=245   ctermbg=235
hi Normal          ctermfg=252   ctermbg=234
hi Number          ctermfg=141
hi Operator        ctermfg=197
hi Pmenu           ctermfg=81    ctermbg=16
hi PmenuSel        ctermfg=255   ctermbg=242
hi PmenuSbar                     ctermbg=232
hi PmenuThumb      ctermfg=81
hi PreCondit       ctermfg=154                 cterm=bold
hi PreProc         ctermfg=154
hi Question        ctermfg=81
hi Repeat          ctermfg=197                 cterm=bold
hi Search          ctermfg=0     ctermbg=222   cterm=NONE
hi SignColumn      ctermfg=118   ctermbg=235
hi SpecialChar     ctermfg=161                 cterm=bold
hi SpecialComment  ctermfg=245                 cterm=bold
hi Special         ctermfg=81
hi SpecialKey      ctermfg=239
if has("spell")
  hi SpellBad                    ctermbg=52
  hi SpellCap                    ctermbg=17
  hi SpellLocal                  ctermbg=17
  hi SpellRare     ctermfg=none  ctermbg=none  cterm=reverse
endif
hi String          ctermfg=222
hi Statement       ctermfg=197                 cterm=bold
hi StatusLine      ctermfg=234   ctermbg=208   cterm=bold
hi StatusLineNC    ctermfg=244   ctermbg=232
hi StorageClass    ctermfg=208
hi Structure       ctermfg=81
hi TabLine         ctermfg=15    ctermbg=242   cterm=none
hi TabLineSel      ctermfg=208   ctermbg=234   cterm=none
hi TabLineFill     ctermfg=242
hi Tag             ctermfg=197
hi Title           ctermfg=15
hi Todo            ctermfg=231   ctermbg=232   cterm=bold
hi Typedef         ctermfg=81
hi Type            ctermfg=81                  cterm=none
hi Underlined      ctermfg=244                 cterm=underline
hi VertSplit       ctermfg=244   ctermbg=232   cterm=bold
hi Visual                        ctermbg=238
hi VisualNOS                     ctermbg=238
hi WarningMsg      ctermfg=231   ctermbg=238   cterm=bold
hi WildMenu        ctermfg=81    ctermbg=16

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
