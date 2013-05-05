" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" less indent for web formats
au BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.php,*.inc set shiftwidth=2 
au BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.php,*.inc set softtabstop=2 
