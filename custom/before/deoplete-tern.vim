" Use deoplete.
let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
" call deoplete#custom#set('buffer', 'min_pattern_length', 9999)
let g:min_pattern_length = 0

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]
