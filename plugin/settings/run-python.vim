function! RunPython()
    " Get the bytecode.
    let output = system("python " . bufname("%") . " 2>&1")

    if output != ""
        " Open a new split and set it up.
        botright new __Python_output__
        setlocal buftype=nofile

        " Insert the output.
        call append(0, split(output, '\v\n'))
    endif
endfunction

autocmd FileType python nnoremap <buffer> <leader>r :call RunPython()<CR>
