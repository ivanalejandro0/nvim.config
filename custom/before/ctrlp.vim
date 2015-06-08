" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nnoremap ,b :CtrlPBuffer<CR>
nnoremap ,g :CtrlPBufTag<CR>
nnoremap ,f :CtrlPLine<CR>
nnoremap ,m :CtrlPMRUFiles<CR>

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction

" CtrlP with default text
nnoremap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nnoremap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nnoremap ,d ,wg
nnoremap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nnoremap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>

" Don't change working directory
let g:ctrlp_working_path_mode = 0

" Ignore this files
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
    \ 'file': '\.pyc$\|\.pyo$',
    \ }

" The Silver Searcher
" if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " currently disabled since a .gitignore issue

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
" endif
