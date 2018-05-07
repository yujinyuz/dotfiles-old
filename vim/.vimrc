set nocompatible
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set backspace=indent,eol,start
set ruler
set number
set relativenumber
set showcmd
set incsearch
set hlsearch
set splitright " :sp split screen to right"
set wildmenu
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamed
set lazyredraw
set noswapfile
set noerrorbells
set visualbell
set conceallevel=3

filetype off 
let mapleader = ","
let python_highlight_all = 1

" Load plugins {
source ~/.vimconfigs/my-plugins.vim
" }

" Load general settings {
source ~/.vimconfigs/general-settings.vim
" }

" Load custom settings for plugins {
source ~/.vimconfigs/plugin-custom-settings.vim
" }

" Load general custom mappings {
source ~/.vimconfigs/custom-mappings.vim
" }

" Load ASUS Keyboard problem fixer {
source ~/.vimconfigs/asus-key.vim
" }
