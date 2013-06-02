let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_no_mappings = 1

" mappings provided by the plugin:
" xmap <c-c><c-c> <Plug>SlimeRegionSend
" nmap <c-c><c-c> <Plug>SlimeParagraphSend
" nmap <c-c>v <Plug>SlimeConfig
xmap <leader><space> <Plug>SlimeRegionSend
nmap <leader><space> <Plug>SlimeParagraphSend
