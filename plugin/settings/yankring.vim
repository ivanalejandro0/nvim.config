" avoid yankring to redefine my C-n
let g:yankring_replace_n_nkey = ''

" store yankring history file in tmp
let g:yankring_history_dir = '~/.vim/dirs/'

" toggle yank ring
nnoremap <silent> <leader>y :YRShow<CR>
