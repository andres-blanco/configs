set clipboard=unnamed
execute pathogen#infect()
filetype plugin indent on
syntax on
colorscheme badwolf
set number
set showcmd
set cursorline
set showmatch
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

let mapleader = ","

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip

au BufRead,BufNewFile Fastfile set filetype=ruby

noremap <leader>a <C-a>
noremap <leader>x <C-x>
