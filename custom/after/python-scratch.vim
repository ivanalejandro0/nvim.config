function! RunPython()
    " Get the output.
    let output = system("python " . bufname("%") . " 2>&1")

    " Use the scratch plugin to display the output
    let g:scratch_buffer_name = '*Python Output*'
    silent call scratch#open()

    if output == ""
        let output = "NOTE: There was no result in the execution."
    endif

    " Clear existing contents
    silent execute "%d"

    " Insert execution output
    0 put = output

    " Return to previous window
    wincmd p
endfunction

autocmd FileType python nnoremap <buffer> <leader>r :call RunPython()<CR>
autocmd FileType python :autocmd User PluginScratchInitializeBefore setlocal filetype=nofile
