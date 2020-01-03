"                 _  _
"                (_)(_)
"   _   _  _   _  _  _  _ __   _   _  _   _  ____
"  | | | || | | || || || '_ \ | | | || | | ||_  /
"  | |_| || |_| || || || | | || |_| || |_| | / /
"   \__, | \__,_|| ||_||_| |_| \__, | \__,_|/___|
"    __/ |      _/ |            __/ |
"   |___/      |__/            |___/
"
"   Author: yujinyuz
"   GitHub: https://github.com/yujinyuz
"   Repository URL: https://github.com/yujinyuz/dotfiles

" General {{{

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)

"" Searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Turn on relative numbers
set relativenumber
" I think we don't need this anymore since there is a line number indicator on
" the bottom right side of the editor
" set number

"" Show matching parenthesis
set showmatch

"" Visual autocomplete for command menu
"" triggered when pressing tab while in the
"" execute command mode `:`
set wildmenu

"" Redraw only when needed
set lazyredraw


"" Draw a ruler on the right side
set colorcolumn=90

"" Create new line when text is over 79 chars
"" change this if we have problems in editing existing code base
set textwidth=79

"" Hide buffer
set hidden

"" Fix paste bug [200~ when remapping jk to escape
set t_BE=

"" Always show signcolumns
set signcolumn=yes

"" Prefer zsh for shell-related tasks
set shell=/usr/local/bin/zsh

"" Group folds with '{{{,}}}'
set foldmethod=marker

"" Disable annoying swap files
set noswapfile
"" No backups
set nobackup
set nowritebackup

"" Use system clipboard
set clipboard=unnamedplus

"" Disable neovim frmo setting cursor style
set guicursor=

"" Only need 1 line for cmd
set cmdheight=1

"" Let vim set the title
set title

"" Search relative to current file and directory
set path=.,**

"" Split right by default
set splitright

"" Split below by default
" set splitbelow

"" Hide the -- INSERT --
"" comment this out when you aren't using lightline.vim
set noshowmode


"" Show whitespaces
" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:·,precedes:«,extends:»

"" Change leader key
let mapleader=","

"" Enable elite mode. No arrows!!
let g:elite_mode=1

"" This fixed my issue with tmux not having the correct color. WTF.
" set termguicolors

"" Enable syntax highlighting
syntax on

"" NeoVim Enabled Defaults {{{
"" Just uncomment the lines with `set` to when not using neovim
"" Autoread file when there are changes
" set autoread

"" Helps force plugins to load correctly when it is turned back on
" filetype off

"" Load file type plugins + indentation
" filetype plugin indent on

"" backspace through everything in insert mode
" set backspace=indent,eol,start


"" Disable annoying bell sound
" set belloff=all
" set visualbell

"" Choose no compatibility with legacy vi
" set nocompatible

"" Use utf-8 file encoding
" set encoding=utf-8

"" Display incomplete commands
" set showcmd

"" Keep info in memory to speed things up
" set history=10000

" Highlight matches
" set hlsearch

" Incremental searching
" set incsearch

"" ID Tags relative to current file and directory
" set tags=./tags;,tags;


" Enable ruler
" set ruler



"" End NeoVim Enabled Defaults }}}

" End General }}}
" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'
" Plug 'yggdroot/indentline'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'


"" These are plugins that I saw from articles
"" that I don't need right now but might need later

" Plug 'Konfekt/FastFold'
" Plug 'iamcco/markdown-preview.nvim'
" Plug 'junegunn/limelight.vim'
" Plug 'jiangmiao/auto-pairs' " this doesn't work well. so I'm using pear-tree
" Plug 'tmsvg/pear-tree'
" Plug 'tpope/vim-unimpaired'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}
" Autocommands {{{
"" Get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

"" Remove whitespace on save
autocmd BufWritePost * :%s/\s\+$//e

" autocmd BufEnter \.* set filetype=sh
" autocmd BufEnter .vimrc set filetype=vim

"" Turn on hybrid numbers
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter * set number
" augroup END
" End Autocommands }}}
" Custom Key Mappings {{{

"" write file
nmap <leader>w :w!<CR>

"" quit vim
"" mapping to <leader>q only is slow
"" might be because of the coc.vim qf mapping
nnoremap <leader>qq :qa!<CR>

"" edit vimrc file
nnoremap <leader>ev :vsplit ~/.vimrc<CR>

"" source vimrc file
nnoremap <leader>sv :source ~/.vimrc<CR>

"" Used for navigating to different split panes
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

"" Map jk to Escape because it's too far away
inoremap jk <Esc>
inoremap <Esc> <NOP>

"" Turn off the arrow keys in normal mode
"" No vim user uses that
" nnoremap <Up> <nop>
" nnoremap <Down> <nop>
" nnoremap <Left> <nop>
" nnoremap <Right> <nop>

"" Let's us move around wrapped lines normally
noremap <silent> j gj
noremap <silent> k gk

"" Stay in visual mode when indenting. You will never have to run
"" gv after performing an indentation
vnoremap < <gv
vnoremap > >gv

"" Blackhole deletes
"" Usage: <leader>d then d again to delete line
nnoremap <leader>d "_d


"" Backspace faster switching to alternate file
nnoremap <BS> :buffer#<CR>

"" Faster buffer navigation
nnoremap ,b :buffer *

"" List all buffers then choose number to go to buffer
nnoremap gb :ls<CR>:b

"" Command-line like forward-search
cnoremap <C-k> <Up>
"" Command-line like reverse-search
cnoremap <C-j> <Down>

"" Map CmdP for FZF File Search
"" Use CtrlP when Cmd-P is not available
nnoremap ++ :Files<CR>


"" Clear search highlight via return
" nnoremap <CR> :noh<CR><CR>

"" Clear search highlight
nnoremap <silent> <leader>, :noh<CR>

" That awful mixed mode with the half-tabs-are-spaces:
" Source: https://vim.fandom.com/wiki/Converting_tabs_to_spaces
" Execute :retab so convert the tabs to spaces
map \M <Esc>:set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
" Mini tabs, small "m":
map \m <Esc>:set expandtab tabstop=2 shiftwidth=2<CR>
" Think "little tabs" and "big tabs":
map \t <Esc>:set expandtab tabstop=4 shiftwidth=4<CR>
map \T <Esc>:set expandtab tabstop=8 shiftwidth=8<CR>


"" Disable arrow movements. Resize splits panes instead
if get(g:, 'elite_mode')
  nnoremap <Up> :resize +2<CR>
  nnoremap <Down> :resize -2<CR>
  nnoremap <Left> :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif

"" Cancel search using escape

"" It seems that when trying to remap the escape key
"" Opening `vim` defaults to replace mode.
"" Commenting out this line in the mean time
"" nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" End Custom Key Mappings }}}
" Plugins Custom Settings {{{

" onedark.vim {{{
" let g:airline_theme='onedark'
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" Defining colorscheme here after setting
" g:onedark_terminal_italics=1
colorscheme onedark
"" }}}

" coc.vim {{{
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-emmet',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-pairs',
  \ 'coc-explorer'
  \ ]
" }}}

" lightline {{{
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }
" }}}

" NERDTree {{{
let g:nerdtree_tabs_open_on_console_startup=0
" map <C-n> :NERDTreeToggle<CR>
map <C-n> :CocCommand explorer<CR>
" }}}

" indentLine {{{
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
" }}}

" pear-tree - auto pairing {{{

"" Disable the mappings since it ruins our mappings
"" Especially <ESC>, <BS> and <CR>
let g:pear_tree_map_special_keys = 0
" }}}

" fzf.vim {{{
let g:fzf_tags_command = 'ctags -R'
" }}}

" netrw (default) {{{
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
" }}}

" End Plugins Custom Settings }}}
" 24-bit (true-color) mode {{{

"" From https://github.com/joshdick/onedark.vim#installation
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check
"and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
" }}}
" coc.vim settings from documentation {{{
" I don't understand most of this part but we can always check the
" documentation

" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" End }}}

" Auto resize Vim splits to active split
" set winwidth=95
" set winheight=5
" set winminheight=5
" set winheight=999