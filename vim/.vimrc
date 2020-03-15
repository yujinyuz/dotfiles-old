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

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)

" Searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Turn on relative numbers
set relativenumber

" Show current line number
set number

" Show matching parenthesis
set showmatch

" How many tenths of a second to blink when matching brakcets
set matchtime=2

" Visual autocomplete for command menu
" triggered when pressing tab while in the
" execute command mode `:`
set wildmenu
" set wildmode=list:longest,list:full

" Disabled wildignore since it conflicts with tags
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Redraw only when needed
set lazyredraw

" Hide buffer
set hidden

" Fix paste bug [200~ when remapping jk to escape
set t_BE=

" Always show signcolumns
set signcolumn=yes

" Prefer sh for shell-related tasks
set shell=/bin/sh

" Disable annoying swap files
set noswapfile

" No backups
set nobackup nowritebackup

" Use system clipboard
set clipboard=unnamedplus

" Disable neovim from setting cursor style
" set guicursor=

" Only need 1 line for cmd
set cmdheight=1

" Let vim set the title
set title

" Search relative to current file and directory
set path=.,**

" Split right by default
set splitright

" Split below by default
" set splitbelow

" Hide the -- INSERT --
" comment this out when you aren't using lightline.vim
" set noshowmode

" Alwayts show tabs
set showtabline=2

" Show whitespaces
" set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:·,precedes:«,extends:»

" Show line column
set colorcolumn=80,90,120

" Show 3 more lines below when scrolling
set scrolljump=3

" Show indicator when line is wrapped
let &showbreak='↳ '
set conceallevel=3

" Disable soft wrapping
set nowrap

" Highlight current line under cursor
" set cursorline

" Change leader key
let mapleader=' '
let localleader='\'

" Enable elite mode. No arrows!!
let g:elite_mode=1

let g:python3_host_prog = '~/.pyenv/versions/3.8.1/envs/nvim/bin/python3'

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

set tags^=.git/tags
" Enable ruler
" set ruler

"" End NeoVim Enabled Defaults }}}

" End General }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
Plug 'alvan/vim-closetag'
Plug 'yujinyuz/eleline.vim'
Plug 'turbio/bracey.vim'
Plug 'psliwka/vim-smoothie'
Plug 'wellle/tmux-complete.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'luochen1990/rainbow'
Plug 'vimwiki/vimwiki'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'liuchengxu/vista.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'ludovicchabant/vim-gutentags'

"" These are plugins that I saw from articles
"" that I don't need right now but might need later

" Plug 'Konfekt/FastFold'
" Plug 'iamcco/markdown-preview.nvim'
" Plug 'junegunn/limelight.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tmsvg/pear-tree'
" Plug 'yggdroot/indentline'
call plug#end()
" }}}

" Autocommands {{{

" Remove whitespace on save
augroup RemoveTrailingWhiteSpace
  autocmd!
  autocmd BufWritePost * :%s/\s\+$//e
augroup END

" Hide statusline when using fzf
augroup FZFFiletypes
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
              \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
augroup END

" Return to last edit position when opening files (You want this!)
augroup ReturnToLastEditPosition
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Toggle highlight when entering in insert / normal mode
augroup ToggleHighlight
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END

augroup CustomFileSettings
  autocmd!
  autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
  " Get correct comment highlighting
  autocmd FileType json syntax match Comment +\/\/.\+$+

  " Enable local spell and disable backticks on coc-pairs
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd FileType eruby let b:coc_pairs_disabled = ['<']
  autocmd FileType javascript let b:coc_pairs_disabled = ['<']
augroup END

augroup EndAutocomplete
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END
" End Autocommands }}}

" Custom Key Mappings {{{

" Write file
nmap <leader>w :w!<CR>

" Quit vim
nnoremap <leader>qa :qa!<CR>

" Quit current file
nmap <leader>qq :q!<CR>

" Edit vimrc file
nnoremap <leader>ev :vsplit ~/.vimrc<CR>

" source vimrc file
nnoremap <leader>sv :source %<CR>

" Used for navigating to different split panes
if !get(g:, 'loaded_tmux_navigator', 0)
  nnoremap <C-J> <C-W>j
  nnoremap <C-K> <C-W>k
  nnoremap <C-H> <C-W>h
  nnoremap <C-L> <C-W>l
endif

" Map jk to Escape because it's too far away
inoremap jk <Esc>

" Yank to end of line
nnoremap Y y$

" Auto center on search match
nnoremap n nzz
nnoremap N Nzz

" Copy/paste and move cursor to end of last operated text or end of putted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Stay in visual mode when indenting. You will never have to run
" gv after performing an indentation
vnoremap < <gv
vnoremap > >gv

" So I don't have to press `>` twice in normal mode
nnoremap > >>gv
nnoremap < <<gv

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap <S-Tab> <<
nnoremap <Tab> >>

" Blackhole deletes
nnoremap <leader>d "_d

" Backspace faster switching to alternate file
nnoremap <BS> :buffer#<CR>:echo bufnr('%') . ': ' . expand('%:p')<CR>

" Faster buffer navigation
nnoremap ,b :buffer *

" List all buffers then choose number to go to buffer
nnoremap gb :ls<CR>:b

" Tab management
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove<CR>

" Command-line like forward/reverse search
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" Map CmdP for FZF File Search
" Use CtrlP when Cmd-P is not available
" nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> ++ :Files<CR>

" Clear search highlight
nnoremap <silent> <leader>l :noh<CR>

" Have a git hunk preview that can be modified
nnoremap ghp <Plug>(GitGutterPreviewHunk)

" Use Alt-jk for moving lines
" Note: iTerm2 > Profiles > Keys > Left Option > Esc+
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" That awful mixed mode with the half-tabs-are-spaces:
" Source: https://vim.fandom.com/wiki/Converting_tabs_to_spaces
" Execute :retab so convert the tabs to spaces
map \M <Esc>:set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
" Mini tabs, small "m":
map \m <Esc>:set expandtab tabstop=2 shiftwidth=2<CR>
" Think "little tabs" and "big tabs":
map \t <Esc>:set expandtab tabstop=4 shiftwidth=4<CR>
map \T <Esc>:set expandtab tabstop=8 shiftwidth=8<CR>

" Vista tags
nmap <localleader>b :Vista!!<CR>

" Rg current word
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

"" Disable arrow movements. Resize splits panes instead
if get(g:, 'elite_mode')
  nnoremap <Up> :resize +2<CR>
  nnoremap <Down> :resize -2<CR>
  nnoremap <Left> :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -5<CR>
endif

nnoremap <leader>f :Rg<CR>

" Open definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Find and Replace highlighted line
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Find and replace with confirmation until EOF
noremap <leader>s "sy:ZZWrap .,$s/<C-r>s//gc<Left><Left><Left>

" Togglewrap
nnoremap <localleader>\ :ToggleWrap<CR>

" Disable annoying Ex mode
nnoremap Q <NOP>

" Visually select pasted or yanked text
nnoremap gV `[v`]

" Access file name data fp = filepath; fn = filename
cnoremap \fp <C-R>=expand("%:p:h")<CR>
inoremap \fp <C-R>=expand("%:p:h")<CR>
cnoremap \fn <C-R>=expand("%:t:r")<CR>
noremap \fn <C-R>=expand("%:t:r")<CR>

" Date and datetime formatted
cnoremap \dt <C-R>=strftime("%b %d, %Y")<CR>
inoremap \dt <C-R>=strftime("%b %d, %Y")<CR>
cnoremap \tn <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
inoremap \tn <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" End Custom Key Mappings }}}

" Colorscheme {{{
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has('termguicolors'))
  set termguicolors
endif
syntax on
colorscheme gruvbox-material
"" }}}

" Plugins custom settings {{{

" coc.vim {{{
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-emmet',
  \ 'coc-json',
  \ 'coc-sql',
  \ 'coc-tsserver',
  \ 'coc-go',
  \ 'coc-pairs',
  \ 'coc-yaml',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-yank',
  \ 'coc-snippets'
  \ ]
" }}}

" eleline {{{
let g:eleline_powerline_fonts = 1
" }}}

" NERDTree {{{
let g:nerdtree_tabs_open_on_console_startup = 0
let NERDTreeNaturalSort = 1
map <silent> <C-n> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let NERDTreeAutoCenter = 1
let g:NERDTreeIndicatorMapCustom =
\ {"modified"  : "✹", "staged"    : "✚",
\ "untracked" : "✭", "renamed"   : "➜",
\ "unmerged"  : "═", "deleted"   : "✖",
\ "dirty"     : "✗", "clean"     : "✔︎",
\ "ignored"   : '☒', "unknown"   : "?"}
" }}}

" closetag.vim {{{
let g:closetag_filenames = '*.html,*.js,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
" }}}

" vim-devicons {{{
" After a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
let g:webdevicons_enable = 1
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
" let g:DevIconsDefaultFolderOpenSymbol = ''
" }}}

" fzf.vim {{{
let g:fzf_tags_command = 'ctags -R'
" let $FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-global'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}

" rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
  \  'separately': {
  \    'nerdtree': 0,
  \   }
  \ }
" }}}

" tmux-navigator {{{
" Disabling tmux-navigator defaults since we are using the <C-\>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" }}}

" vim-gitgutter {{{
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'
let g:gitgutter_preview_win_floating = 0
" }}}

" endwise {{{
let g:endwise_no_mappings = 1
" }}}

" End Plugins Custom Settings }}}

" User-Defined Functinos {{{
function! CreateCenteredFloatingWindow() abort
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
endfunction

" Rg with preview window
" https://github.com/junegunn/fzf.vim/issues/714#issuecomment-428802659
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'down'), <bang>0)

function! RipgrepFzf(query, fullscreen) abort
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}, 'down'), <bang>0)

" Current file to unsaved version
function! s:DiffWithSaved() abort
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffSaved call s:DiffWithSaved()

function! s:ToggleWrap() abort
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    silent! unmap <buffer> j
    silent! unmap <buffer> k
    silent! unmap <buffer> $
    silent! unmap <buffer> 0
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    noremap <buffer> <silent> j gj
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> $ g$
    noremap <buffer> <silent> 0 g0
  endif
endfunction
command! ToggleWrap call s:ToggleWrap()

function! CtagPython()
    !ctags -R --fields=+l --languages=python --python-kinds=-i -f ./tags $(python3 -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
    echo getcwd()
endfunction

" Substitue selected text starting from cursor up to EOF
command! -nargs=* -complete=command ZZWrap let &scrolloff=999 | exec <q-args> | let &so=0

" Delete all buffers except current one
command! BufOnly silent! execute "%bd|e#|bd#"
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

" Make CoC and endwise compatible
inoremap <expr> <Plug>CustomCocCR pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>cn <Plug>(coc-rename)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup CocGroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
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

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <localleader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <localleader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <localleader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <localleader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <localleader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <localleader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <localleader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <localleader>p  :<C-u>CocListResume<CR>

" End }}}

" Abbreviations for a better vim-life {{{
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev wQ wq
" }}}

" vim:filetype=vim sw=2 foldmethod=marker tw=78 expandtab:
