" For to-do lists
" [ ] insert this at the beginning -> \0
" [ ] to do                        -> \1
" [~] in progress                  -> \2
" [✔] resolved                     -> \3
" [✘] rejected                     -> \3
autocmd FileType taskedit :nnoremap <buffer> <leader>0 mzI[ ] <ESC>`z
autocmd FileType taskedit :nnoremap <buffer> <leader>1 mz:s/\[.\]/[ ]/<CR>`z
autocmd FileType taskedit :nnoremap <buffer> <leader>2 mz:s/\[.\]/[\~]/<CR>`z
autocmd FileType taskedit :nnoremap <buffer> <leader>3 mz:s/\[.\]/[✔]/<CR>`z
autocmd FileType taskedit :nnoremap <buffer> <leader>4 mz:s/\[.\]/[✘]/<CR>`z
" autocmd FileType taskedit :nnoremap <buffer> <leader>4 mz:s/\[.\]/[✗]/<CR>`z
