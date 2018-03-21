syntax on

set nocompatible
set smartindent
set shiftwidth=4
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set splitright " :sp split screen to right"
set wildmenu
set encoding=utf8
set lazyredraw

filetype off 
let mapleader = ","
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Clearlast search pattern
nnoremap <silent> <CR> :noh<CR><CR>

"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()  
"-------------- PLUGINS END --------------------
filetype plugin indent on



"----- GENERAL SETTINGS-------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.py[co]$']

"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_python_checkers = ['flake8']


augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


"-------- TAGS SETTINGS --------------------------------
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:tagbar_autoclose=2
let g:easytags_python_enabled = 1

"--------- YouCompleteME ---------------
let g:ycm_python_binary_path = 'python' " Calls the python virtenv"
let g:ycm_semantic_triggers = {
	    \ 'python': [ 're!\w{2}' ]
	    \ }

nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
let g:gitgutter_highlight_lines = 1
set updatetime=100


"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2

" --------- Whitespace -------
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"----------- CtrlP File finder
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'results:100'
set wildignore+=/tmp/*,.git,node_modules,*.py[co]

"------- Updating ~/.vimrc file -----
:nnoremap <leader>ev :vsplit $MYVIMRC<CR> " edit vim file"
:nnoremap <leader>sv :source $MYVIMRC<CR> " source vim file"
":autocmd BufWritePost .vimrc source $MYVIMRC
"-------- Ease of access??
:inoremap jk <esc>
:inoremap <esc> <nop>

function! ToggleScrollMode()
    if exists("s:scroll_mode")
	unmap k
	unmap j
	unlet s:scroll_mode
	echom "scroll mode off"
    else
	nnoremap j <C-e>j
	nnoremap k <C-y>k
	let s:scroll_mode = 1
	echom "scroll mode on"
    endif
endfunction

nnoremap <leader>\ :call ToggleScrollMode()<CR>

