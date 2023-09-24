vim.cmd([[
" Change Your Vim Cursor from a Block to Line in Normal and Insert Mode
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"

color murphy
set number relativenumber ignorecase mouse=a
set clipboard="unnamedplus"

let mapleader=" "
let localmapleader=" "
nnoremap ; :
inoremap jk <ESC>
nnoremap <silent> <C-s> :w<cr>
nnoremap <silent> <C-q><C-x> :q!<cr>
nnoremap <silent> <leader>e <cmd>e ./<cr>
nnoremap <silent> <leader>x <cmd>bdelete!<cr>
nnoremap <silent> L :bn<cr>
nnoremap <silent> H :bp<cr>
nnoremap <silent> <tab> :bn<cr>
nnoremap <silent> <S-tab> :bp<cr>
]])

require("core")

