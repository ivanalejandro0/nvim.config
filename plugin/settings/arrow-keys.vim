" Arrow keys configuration
" Values: Enabled (or not set), Disabled, Motion
" let g:arrow_keys_behavior = 'Enabled'
" let g:arrow_keys_behavior = 'Disabled'
let g:arrow_keys_behavior = 'Motion'

if !exists('g:arrow_keys_behavior')
    let g:arrow_keys_behavior = 'Enabled'
endif

if g:arrow_keys_behavior == 'Disabled'
    " Disable arrow keys
    nnoremap <Up> <nop>
    nnoremap <Down> <nop>
    nnoremap <Left> <nop>
    nnoremap <Right> <nop>
elseif g:arrow_keys_behavior == 'Motion'
    " Give arrow keys a new meaning in life :)
    nnoremap <Up> <C-y>
    nnoremap <Down> <C-e>
    nnoremap <Right> 10zl
    nnoremap <Left> 10zh
endif
