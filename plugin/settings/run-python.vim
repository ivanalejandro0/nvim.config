function! RunPython()
    " Get the output.
    let output = system("python " . bufname("%") . " 2>&1")

    if !exists("g:run_python_split_type")
        let g:run_python_split_type = "vertical"
    endif

    " for reference look at vim doc or this url:
    " http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
    " let split_command = "botright new"   " horizontal split
    " let split_command = "botright vnew"  " vertical split
    if g:run_python_split_type == 'vertical'
        let split_command = "botright vnew"
    else
        let split_command = "botright new"
    endif

    if output != ""
        " Open a new split and set it up.
        exec(split_command . " __Python_output__")
        setlocal buftype=nofile

        " Insert the output.
        call append(0, split(output, '\v\n'))
    endif
endfunction

let g:run_python_split_type = "vertical"
autocmd FileType python nnoremap <buffer> <leader>r :call RunPython()<CR>
