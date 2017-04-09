if executable('ag')
  let g:ackprg = 'ag --column --nogroup --noheading'
endif

" highlight the searched term
let g:ackhighlight = 1
