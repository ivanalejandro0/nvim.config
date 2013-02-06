" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set encoding=utf-8
    filetype plugin indent on " load filetype plugins/indent settings
    syntax on " syntax highlighting on
    setlocal spelllang=es " en
    " Scrolling {
        set scrolloff=3  " Start scrolling when we're 3 lines away from margins
        set sidescrolloff=15
        set sidescroll=1
    " }
" }

" General {
    set backspace=indent,eol,start  " backspace through everything in insert mode
    " set autochdir " always switch to the current file directory
    set backup " make backup files
    set backupdir=~/.vim/backup " where to put backup files
    set directory=~/.vim/tmp " directory to place swap files in
" }

" set smarttab
" set smartindent

" Text Formatting/Layout {
    set expandtab " no real tabs please!
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4 " auto-indent amount when using cindent,
                     " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                      "should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with
                  " set list on
    " set ignorecase " case insensitive by default
    " set smartcase " if there are caps, go case-sensitive
" }

" Vim UI {
    " Status line { (from https://github.com/swaroopch/dotvim/blob/master/vimrc)
        set laststatus=2 " always show the status line
        set statusline=
        set statusline+=%-3.3n\ " buffer number
        set statusline+=%f\ " filename
        set statusline+=%h%m%r%w " status flags
        if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
            set statusline+=%{fugitive#statusline()} " git status
        endif
        if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
            set statusline+=%{SyntasticStatuslineFlag()} " syntastic status - makes sense with :Errors
        endif
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
        set statusline+=%= " right align remainder
        set statusline+=0x%-8B " character value
        set statusline+=%-14(%l,%c%V%) " line, character
        set statusline+=%<%P " file position
    " }
    set incsearch  " incremental search (search as you type)
    set nohlsearch   " highlighted search results
    set number  " show line numbers
    set cursorline " highlight current line
" }

" Plugin settings {
    " start the plugin manager
    call pathogen#infect()
    call pathogen#helptags()

    " autofocus on Tagbar open
    let g:tagbar_autofocus = 1

    " Ignore files on NERDTree
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" }

" Mappings {
    " Show pending task lint
    map <F2> :TaskList<CR>

    " NERDTree (better file browser) toggle
    map <F3> :NERDTreeToggle<CR>

    " Close the NERD Tree with Shift-F3
    nmap <S-F3> :NERDTreeClose<CR>

    " toggle Tagbar display
    map <F4> :TagbarToggle<CR>

    " toggle search highlighting
    nnoremap <silent> <F11> :set hlsearch!<CR>

    " Working with tabs
    map <C-l> :tabn<CR>
    map <C-h> :tabp<CR>
    nnoremap <C-n> :tabnew 
    imap <C-l> <ESC>:tabn<CR>
    imap <C-h> <ESC>:tabp<CR>
    " imap <C-n> <ESC>:tabnew 

    " Make horizontal scrolling easier
    " Disabled because C-i and C-o are used for the vim's jumplist
    " nmap <silent> <C-o> 10zl
    " nmap <silent> <C-i> 10zh

    " Navigate windows with meta+arrows
    map <M-Right> <c-w>l
    map <M-Left> <c-w>h
    map <M-Up> <c-w>k
    map <M-Down> <c-w>j
    imap <M-Right> <ESC><c-w>l
    imap <M-Left> <ESC><c-w>h
    imap <M-Up> <ESC><c-w>k
    imap <M-Down> <ESC><c-w>j

    " js-beautify mappings
    vmap gb :!~/.vim/bundle/jsbeautifier/js-beautify.py/js-beautify -i<CR>

    " CtrlP (new fuzzy finder)
    let g:ctrlp_map = ',e'
    nmap ,g :CtrlPBufTag<CR>
    nmap ,f :CtrlPLine<CR>
    nmap ,m :CtrlPMRUFiles<CR>
    " to be able to call CtrlP with default search text
    function! CtrlPWithSearchText(search_text, ctrlp_command_end)
        execute ':CtrlP' . a:ctrlp_command_end
        call feedkeys(a:search_text)
    endfunction
    " CtrlP with default text
    nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
    nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
    nmap ,d ,wg
    nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
    nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
    " Don't change working directory
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
      \ 'file': '\.pyc$\|\.pyo$',
      \ }
    " Fix to let ESC work as espected with Autoclose plugin
    let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
" }

" Autocommands { 
    " automatically close autocompletion window
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " Web devel {
        " less indent for web formats
        au BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.php,*.inc set shiftwidth=2 
        au BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.php,*.inc set softtabstop=2 
    " }
" }

" Command abbreviations {
    " save a file you edited in vim asking sudo permission.
    ca w!! w !sudo tee % >/dev/null
" }

" Folding {
    set foldmethod=indent   " fold based on indent
    set foldnestmax=10      " deepest fold is 10 levels
    set nofoldenable        " dont fold by default
    set foldlevel=1         " this is just what i use
" }

" Color schemes {
    " use 256 colors when possible
    if &term =~? 'mlterm\|xterm\|screen-256'
        let &t_Co = 256
        colorscheme fisa
    else
        colorscheme delek
    endif

    " colors for gvim
    if has('gui_running')
        colorscheme wombat
    endif
" }

