" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" less indent for some web formats
autocmd FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss       setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" filetype selection
autocmd BufRead,BufNewFile *.mustache set filetype=html
autocmd BufRead,BufNewFile *.md set filetype=markdown
