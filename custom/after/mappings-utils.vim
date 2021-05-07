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
nnoremap <silent> <leader>u :t.<CR>Vr=

" Select all
nnoremap <leader>a ggVG

" Delete text
nnoremap <leader>d "_dd
vnoremap <leader>d "_d

" Quicker buffer deletion
nnoremap <leader>q :bd<CR>

" Swap sides between '='. Customized from:
" http://stackoverflow.com/questions/1374105/swap-text-around-equal-sign
nnoremap <leader>= :s/\v(\s*)([^=]*)\s+\=\s+([^;]*)/\1\3 = \2<CR>

" Toggle color column marker at 80
" credit: http://www.vimbits.com/bits/317
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=80,100
  endif
endfunction

nnoremap <silent> co8 :call g:ToggleColorColumn()<CR>

" toggle paste mode (vim-unimpaired style)
nnoremap <silent> cop :set paste! paste?<CR>

" Scroll split window without switching
nnoremap <silent><M-S-Up> :wincmd w<CR><C-U>:wincmd w<CR>
nnoremap <silent><M-S-Down> :wincmd w<CR><C-D>:wincmd w<CR>

" Move tabs
nnoremap <M-S-Left> :tabm -1<CR>
nnoremap <M-S-Right> :tabm +1<CR>
