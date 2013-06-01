" submode settings
let g:submode_timeout = 0
let g:submode_keep_leaving_key = 1

" window submode definition
call submode#enter_with('window', 'n', '', '<F6>')
call submode#leave_with('window', 'n', '', '\q')

" moving cursor
call submode#map('window', 'n', '', 'h', '<C-w>h')
call submode#map('window', 'n', '', 'j', '<C-w>j')
call submode#map('window', 'n', '', 'k', '<C-w>k')
call submode#map('window', 'n', '', 'l', '<C-w>l')

" moving windows
call submode#map('window', 'n', '', 'h', '<C-w>h')
call submode#map('window', 'n', '', 'j', '<C-w>j')
call submode#map('window', 'n', '', 'k', '<C-w>k')
call submode#map('window', 'n', '', 'l', '<C-w>l')

" splits
call submode#map('window', 'n', '', 's', '<C-w>s')
call submode#map('window', 'n', '', 'v', '<C-w>v')

" close
call submode#map('window', 'n', '', 'c', '<C-w>c')

" resizing
call submode#map('window', 'n', '', '>', '<C-w>>')
call submode#map('window', 'n', '', '<', '<C-w><')
call submode#map('window', 'n', '', '+', '<C-w>+')
call submode#map('window', 'n', '', '-', '<C-w>-')

call submode#map('window', 'n', '', '=', '<C-w>=')

