set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_exec = 'tidy5'  " http://www.html-tidy.org/
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]  " to avoid some angularjs errors

let g:syntastic_javascript_checkers = ['eslint']
