" https://github.com/neovim/neovim/issues/6403
" letter 'q' appearing all over the console and even outside nvim on tmux
set guicursor=

" add all the plugins
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" General settings {
    " Use Vim settings, rather then Vi settings (much better!).
    " This must be first, because it changes other options as a side effect.
    set nocompatible

    " set termguicolors

    " A buffer becomes hidden when it is abandoned
    set hidden

    set encoding=utf-8
    syntax on " syntax highlighting on
    setlocal spelllang=es " en

    " == Scrolling ==
    set scrolloff=3  " Start scrolling when we're 3 lines away from margins
    set sidescrolloff=15
    set sidescroll=1

    set backspace=indent,eol,start  " backspace through everything in insert mode

    set directory=~/.config/nvim/dirs/tmp     " directory to place swap files in
    set backup                        " make backup files
    set backupdir=~/.config/nvim/dirs/backups " where to put backup files
    set undofile                      " persistent undos - undo after you re-open the file
    set undodir=~/.config/nvim/dirs/undos
    set viminfo+=n~/.config/nvim/dirs/viminfo

    " Create needed directories if they don't exist
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif

    set number     " show line numbers
    set cursorline " highlight current line

    " timeout settings to avoid delay switching modes
    set timeoutlen=1000 ttimeoutlen=0
" }

" Text Formatting/Layout {
    set nowrap " do not wrap line
    set list listchars=tab:>-,trail:· " format for non-printable characters

    " Search
    set ignorecase " Ignore case when searching...
    set smartcase  " ...unless we type a capital             "
    set incsearch  " incremental search (search as you type)
    set nohlsearch " don't highlight search results
    set nowrapscan " stop searching after reaching first/last occurrence
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

" Status line { (from https://github.com/swaroopch/dotvim/blob/master/vimrc)
    " set laststatus=2                             " always show the status line
    " set statusline=
    " set statusline+=%-3.3n\                      " buffer number
    " set statusline+=%f\                          " filename
    " set statusline+=%h%m%r%w                     " status flags
    " set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
    " set statusline+=%=                           " right align remainder
    " set statusline+=0x%-8B                       " character value
    " set statusline+=%-14(%l,%c%V%)               " line, character
    " set statusline+=%<%P                         " file position
" }

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

set termguicolors

" Color schemes {
    " use 256 colors when possible
    if &term =~? 'mlterm\|xterm\|xterm-256color\|screen-256\|nvim'
        let &t_Co = 256
        " colorscheme fisa
        " colorscheme kalisi
        colorscheme jellybeans
    else
        colorscheme delek
    endif

    " colors for gvim
    if has('gui_running')
        " colorscheme wombat
        colorscheme jellybeans
        set guioptions-=T
        " set guifont=Droid\ Sans\ Mono\ 12
    endif
" }
