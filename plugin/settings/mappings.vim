" toggle search highlighting
nnoremap <silent> <F11> :set hlsearch! hlsearch?<CR>

" toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" toggle list non-printable characters
nnoremap <silent> <leader>l :set list! list?<CR>

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" toggle paste mode
nnoremap <silent> <leader>p :set paste! paste?<CR>


" Working with tabs
noremap  <C-l> :tabn<CR>
noremap  <C-h> :tabp<CR>
inoremap <C-l> <ESC>:tabn<CR>
inoremap <C-h> <ESC>:tabp<CR>
nnoremap <C-n> :tabnew 
" imap <C-n> <ESC>:tabnew 

" Navigate windows with meta+arrows
noremap  <M-Right> <c-w>l
noremap  <M-Left> <c-w>h
noremap  <M-Up> <c-w>k
noremap  <M-Down> <c-w>j
inoremap <M-Right> <ESC><c-w>l
inoremap <M-Left> <ESC><c-w>h
inoremap <M-Up> <ESC><c-w>k
inoremap <M-Down> <ESC><c-w>j

" Make horizontal scrolling easier
" Disabled because C-i and C-o are used for the vim's jumplist
" nmap <silent> <C-o> 10zl
" nmap <silent> <C-i> 10zh
