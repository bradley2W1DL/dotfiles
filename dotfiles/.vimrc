" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" vim-plug plugin manager
call plug#begin()
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'tstelzer/welpe.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
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

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
