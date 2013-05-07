" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" fixes delay in change mode, look at https://github.com/Townk/vim-autoclose/issues/34
let g:AutoClosePreserveDotReg = 0
