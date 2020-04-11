" Return to last edit position when opening files (You want this!)
augroup ReturnToLastEditPosition
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
augroup END

" Toggle highlight when entering in insert / normal mode
augroup ToggleHighlight
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END

" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
augroup EndAutocomplete
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | silent! pclose | endif
augroup END
