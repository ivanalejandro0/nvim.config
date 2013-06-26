let s:help_text = "==> Error: command not set!\n"
let s:help_text = s:help_text . "You should set the variable g:command_scratch in order to get the s:help_texts here.\n"
let s:help_text = s:help_text . "for example: let g:command_scratch = 'ls -l'"

function! RunCommand()
    " Use the scratch plugin to display the output
    let g:scratch_buffer_name = '*Command Output*'
    silent call scratch#open()
    setlocal filetype=nofile nolist buftype=nofile
    nnoremap <buffer> <leader>s :silent call scratch#close()<CR>

    if exists('g:command_scratch') && g:command_scratch != ""
        " Display this message here in case of some delay in getting output
        let executing_msg = "==> Executing command: " . g:command_scratch . "\n"
        silent execute "%d"
        0 put = executing_msg

        " Redraw the screen, don't wait to finish function.
        " This allows to display the previous message even if the commands
        " takes long time to execute.
        redraw

        try
            let result = system(g:command_scratch)
        catch
            " to reproduce set the command to 'time'
            let result = "==> ERROR: there was a problem executing command."
        endtry
    else
        let executing_msg = "==> Executing command: NOT SET!\n"
        let result = s:help_text
    endif

    if result == ""
        let result = "==> There was no result in the execution"
    endif

    let output = executing_msg . "==> Results of the execution:\n\n" . result

    silent execute "%d"
    0 put = output
endfunction

" If the command isn't set, use a default command
let set_default_command = 0
if !exists('g:command_scratch') && set_default_command
    let g:command_scratch = "echo 'dummy command :)'"
    let g:command_scratch = "cal -3 -h; echo; date"
endif

nnoremap <leader>R :call RunCommand()<CR>
