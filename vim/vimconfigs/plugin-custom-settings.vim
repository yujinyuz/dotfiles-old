"--- silver searcher
let g:ag_working_path_mode="r"
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
" nnoremap <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.py[co]$']

"------------------------------------

"-------- SYNTASTIC SETTINGS---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1 " show error window for python syntax check
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚐"
let g:syntastic_python_checkers = ['flake8']

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

"------------------------------------

"-------- TAGS SETTINGS -------------
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:tagbar_autoclose=2
let g:easytags_python_enabled = 1

"------------------------------------

"--------- YouCompleteME ------------
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = 'python' " Calls the python virtenv"
let g:ycm_semantic_triggers = {
	    \ 'python': [ 're!\w{2}' ]
	    \ }

autocmd InsertLeave * pclose
nmap <silent> <leader>b :TagbarToggle<CR> " Shows tagbars. Cool!

"------------------------------------

"---------AIRLINE SETTINGS-----------
let g:airline_detect_paste=1
let g:airline_powerline_fonts = 1
" let g:airline_theme='term'
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


"------------------------------------

"---------GIT SETTINGS---------------
hi clear SignColumn
let g:gitgutter_highlight_lines = 1
set updatetime=100

"------------------------------------

"----------DELIMITEMATE SETTINGS-----
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"------------------------------------

"-----------TMUX SETTINGS------------
let g:tmux_navigator_save_on_switch = 2

"------------------------------------

"----------- CtrlP File finder-------
" <C-v> open in new vertical tab
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'results:100'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=/tmp/*,.git,node_modules,*.py[co]

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"------------------------------------

"--------- Vim workspace
let g:workspace_autosave = 0
let g:workspace_session_name = '.workspace.vim'
let g:workspace_autosave_ignore = ['gitcommit', 'tagbar']
nnoremap <leader>s :ToggleWorkspace<CR>

" --------- Whitespace -------
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
