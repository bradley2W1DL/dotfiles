" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" vim-plug plugin manager
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:airline_theme='hybrid'
let g:airline#extensions#branch#enabled = 1

syntax on
set background=dark
colorscheme hybrid_material 
set number
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
