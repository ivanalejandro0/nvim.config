" default:
" let g:auto_save_events = ["InsertLeave", "TextChanged"]

" careful, adding "TextChangedI" makes insert slower
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI"]
