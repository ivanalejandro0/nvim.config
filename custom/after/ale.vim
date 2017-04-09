let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nnoremap <C-k> :ALEPreviousWrap<Return>
nnoremap <C-j> :ALENextWrap<Return>
" nnoremap <silent> <C-k> :ALEPreviousWrap<Return>
" nnoremap <silent> <C-j> :ALENextWrap<Return>
