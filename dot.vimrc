" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set encoding=utf-8
    filetype plugin indent on " load filetype plugins/indent settings
    syntax on " syntax highlighting on
    setlocal spelllang=es " en
    colorscheme delek
" }

" General {
    set backspace=indent,eol,start  " backspace through everything in insert mode
    set autochdir " always switch to the current file directory
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
    set laststatus=2 " always show the status line
    set incsearch  " incremental search (search as you type)
    set nohlsearch   " highlighted search results
    set number  " show line numbers
    set cursorcolumn " highlight the current column
    set cursorline " highlight current line

" Plugin settings {
    " start the plugin manager
    call pathogen#infect()
    call pathogen#helptags()

    " autofocus on Tagbar open
    let g:tagbar_autofocus = 1
" }

" Mappings {
    " Show pending task lint
    map <F2> :TaskList<CR>

    " NERDTree (better file browser) toggle
    map <F3> :NERDTreeToggle<CR>

    " toggle Tagbar display
    map <F4> :TagbarToggle<CR>

    " Working with tabs
    map <C-l> :tabn<CR>
    map <C-h> :tabp<CR>
    map <C-n> :tabnew 
" }

" Autocommands {
    " Web devel {
        " less indent for web formats
        au BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.php,*.inc set shiftwidth=2 
        au BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.php,*.inc set softtabstop=2 
    " }
" }

" Folding {
    set foldmethod=indent   " fold based on indent
    set foldnestmax=10      " deepest fold is 10 levels
    set nofoldenable        " dont fold by default
    set foldlevel=1         " this is just what i use
" }
