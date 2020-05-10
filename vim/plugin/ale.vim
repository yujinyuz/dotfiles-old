" let g:ale_disable_lsp = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '◉'
let g:ale_sign_warning = '⚠'
let g:ale_on_enter = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

" https://github.com/dense-analysis/ale/issues/249
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" hi link ALEErrorSign    Error
" hi link ALEWarningSign  Warning

highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=NONE
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=NONE

" hi link ALEErrorSign GruvboxYellow
" hi link ALEWarningSign GruvboxRed
