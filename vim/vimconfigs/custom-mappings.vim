"------- Updating ~/.vimrc file -----
nnoremap <leader>ev :vsplit $MYVIMRC<CR> " edit vim file"
nnoremap <leader>sv :source $MYVIMRC<CR> " source vim file"
autocmd BufWritePost .vimrc source $MYVIMRC
"------------------------------------

"-------- Ease of access for myself?
inoremap jk <esc>
inoremap <esc> <nop>

nnoremap j gj
nnoremap k gk

"-----------------------------------

" Switching buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
" ----------------------------------

" Clearlast search pattern
nnoremap <silent> <CR> :noh<CR><CR>
" ---------------------------------
