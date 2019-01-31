" less indent for some web formats
autocmd FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss       setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType qml        setlocal shiftwidth=2 tabstop=2 softtabstop=2

" filetype selection
autocmd BufRead,BufNewFile *.mustache set filetype=html
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.jsx

" golang spacing
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
