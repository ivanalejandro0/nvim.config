" override jellybeans config, no bg -> transparency
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', 'guibg': 'none' },
\    'CursorLine': { 'ctermbg': '383838', 'ctermfg': 'none', 'guibg': '383838', 'guifg': 'none' },
\    'CursorColumn': { 'ctermbg': '383838', 'ctermfg': 'white', 'guibg': '383838', 'guifg': 'white' },
\    'ColorColumn': { 'ctermbg': '692020', 'ctermfg': 'white', 'guibg': '692020', 'guifg': 'white' },
\}

" This could be achieved with these as well:
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE
" Note: this should live on "after/", not "before/" to work.
