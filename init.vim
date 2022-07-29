" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
" Disable modeline because of its security issues
set nomodeline

" https://github.com/neovim/neovim/issues/6403
" letter 'q' appearing all over the console and even outside nvim on tmux
set guicursor=

" add all the plugins
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" General settings {

    " A buffer becomes hidden when it is abandoned
    set hidden

    set encoding=utf-8
    syntax on " syntax highlighting on
    setlocal spelllang=en

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

    " set viminfo+=n~/.config/nvim/dirs/viminfo
    set shada='1000,<50,s100,h
    set shada+=n~/.config/nvim/dirs/shada
    " 'shadafile' doesn't seem to be useful to set the shada file location and
    " I had to use the 'n' option for 'shada'
    " set shadafile="~/.config/nvim/dirs/shada"

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

    " when switching to a buffer, reuse open tab if possible
    set switchbuf=usetab,newtab
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

    " vertical splits opens to the right (default is left)
    set splitright
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
    set breakindent
    set linebreak
    set showbreak=\\\\\

    filetype plugin indent on " load filetype plugins/indent settings
" }

" Folding {
    set foldmethod=indent " fold based on indent
    set foldnestmax=10    " deepest fold is 10 levels
    set nofoldenable      " dont fold by default
    set foldlevel=1       " this is just what i use
" }

set wildoptions=pum

set termguicolors

set inccommand=nosplit

set mouse=nv

" Color schemes {
" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256color\|screen-256\|nvim'
    let &t_Co = 256
    " colorscheme jellybeans
lua << EOF
require('kanagawa').setup({
    transparent = true,  -- default: false
    -- dimInactive = false,  -- dim inactive window `:h hl-NormalNC`
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
EOF
else
    colorscheme delek
endif
