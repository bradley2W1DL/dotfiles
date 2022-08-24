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
Plug 'tpope/vim-surround'
Plug 'tomlion/vim-solidity'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

" Ideally this would be conditional on the presence of NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
