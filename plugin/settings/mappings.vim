" move forward one character in insert mode
" useful to skip characteres inserted by autoclose
inoremap <C-f> <Right>

" Working with tabs
nnoremap  <C-l> :tabn<CR>
nnoremap  <C-h> :tabp<CR>
inoremap <C-l> <ESC>:tabn<CR>
inoremap <C-h> <ESC>:tabp<CR>
nnoremap <C-n> :tabnew
" imap <C-n> <ESC>:tabnew

" Navigate windows with meta+arrows
nnoremap  <M-Right> <c-w>l
nnoremap  <M-Left> <c-w>h
nnoremap  <M-Up> <c-w>k
nnoremap  <M-Down> <c-w>j
inoremap <M-Right> <ESC><c-w>l
inoremap <M-Left> <ESC><c-w>h
inoremap <M-Up> <ESC><c-w>k
inoremap <M-Down> <ESC><c-w>j
