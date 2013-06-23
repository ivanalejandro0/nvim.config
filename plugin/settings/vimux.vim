" Here is how to use vimux to send code to a REPL. This is similar to tslime.
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" Custom version of the previous function to play well with IPython.
function! VimuxIpython()
    call VimuxSendText('%cpaste')
    call VimuxSendKeys("Enter")
    call VimuxSendText(@v)
    call VimuxSendKeys("^d")
endfunction

" Prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane map
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" If text is selected, save it in the v buffer and send that buffer it to tmux
vnoremap <Leader>vs "vy :call VimuxSlime()<CR>

" If text is selected, save it in the v buffer and send that buffer it to tmux
vnoremap <Leader>vI "vy :call VimuxIpython()<CR>
