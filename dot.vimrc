" General settings {
    " Use Vim settings, rather then Vi settings (much better!).
    " This must be first, because it changes other options as a side effect.
    set nocompatible

    set encoding=utf-8
    syntax on " syntax highlighting on
    setlocal spelllang=es " en

    " == Scrolling ==
    set scrolloff=3  " Start scrolling when we're 3 lines away from margins
    set sidescrolloff=15
    set sidescroll=1

    set backspace=indent,eol,start  " backspace through everything in insert mode

    set backup                  " make backup files
    set backupdir=~/.vim/backup " where to put backup files
    set directory=~/.vim/tmp    " directory to place swap files in

    set number     " show line numbers
    set cursorline " highlight current line
" }

" Text Formatting/Layout {
    set nowrap " do not wrap line
    set list listchars=tab:>-,trail:·,eol:$ " format for non-printable characters

    " Search
    set smartcase  " if there are caps, go case-sensitive
    set incsearch  " incremental search (search as you type)
    set nohlsearch " don't highlight search results
" }

" Indentation {
    set expandtab      " no real tabs please!
    set shiftround     " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4   " auto-indent amount when using cindent,
                       " >>, << and stuff like that
    set softtabstop=4  " when hitting tab or backspace, how many spaces
                       " should a tab be (see expandtab)
    set tabstop=8      " real tabs should be 8, and they will show with
                       " set list on

    filetype plugin indent on " load filetype plugins/indent settings
" }

" Folding {
    set foldmethod=indent " fold based on indent
    set foldnestmax=10    " deepest fold is 10 levels
    set nofoldenable      " dont fold by default
    set foldlevel=1       " this is just what i use
" }

" start the plugin manager
call pathogen#infect()
call pathogen#helptags()

" Status line { (from https://github.com/swaroopch/dotvim/blob/master/vimrc)
    set laststatus=2                             " always show the status line
    set statusline=
    set statusline+=%-3.3n\                      " buffer number
    set statusline+=%f\                          " filename
    set statusline+=%h%m%r%w                     " status flags
    set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
    set statusline+=%=                           " right align remainder
    set statusline+=0x%-8B                       " character value
    set statusline+=%-14(%l,%c%V%)               " line, character
    set statusline+=%<%P                         " file position
" }

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Color schemes {
    " use 256 colors when possible
    if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
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
