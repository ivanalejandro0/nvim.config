" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" save a file you edited in vim asking sudo permission.
ca w!! w !sudo tee % >/dev/null

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" Formats the entire file.
nnoremap <leader>F :normal! gg=G``<CR>

" Underline the current line with '='
nmap <silent> <leader>u :t.<CR>Vr=
