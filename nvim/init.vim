" Use vim setup
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set notermguicolors
colorscheme jerokai

lua vim.lsp.enable("ruby-lsp")
lua vim.lsp.enable("ts_ls")
lua vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
