" override jellybeans config, no bg -> transparency
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', 'guibg': 'none' },
\}

" This could be achieved with these as well:
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE
