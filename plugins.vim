if empty(glob('~/.vim/plugged'))
  autocmd VimEnter * PlugInstall
endif

for f in split(glob('~/.vim/custom/before/*.vim'), '\n')
    exe 'source' f
endfor

call plug#begin('~/.vim/plugged')

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Emmet/ZenCoding: Magical way to code html
Plug 'mattn/emmet-vim'

" tComment: Code commenter
Plug 'tomtom/tcomment_vim'

" Syntastic: Syntax checker
Plug 'scrooloose/syntastic'

" TagBar: Class browser
Plug 'majutsushi/tagbar'

" Yankring: Copy history navigation
" this needs to be loaded before 'surround' since overrides 'S' key mapping
Plug 'maxbrunsfeld/vim-yankstack'

" Surround: Surrounding text util
Plug 'tpope/vim-surround'

" CtrlP: Partial pattern explore
Plug 'kien/ctrlp.vim'

" Matchit: Extended match plugin
" http://www.vim.org/scripts/script.php?script_id=39
Plug 'matchit.zip'

" UltiSnips: Snippets
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" MatchTag: Color match html/xml tags
Plug 'gregsexton/MatchTag'

" vim-javascript: Javascript improvements
Plug 'pangloss/vim-javascript'

" auto-pairs: Autoclose feature
Plug 'jiangmiao/auto-pairs'

" misc helper mappings
Plug 'tpope/vim-unimpaired'

Plug 'bling/vim-airline'

" tabular: Tabular, the text aligner
Plug 'godlygeek/tabular'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" vim-repeat: Repeating support for plugins
Plug 'tpope/vim-repeat'

" vim-indent-object: Indent Text Object
Plug 'michaeljsmith/vim-indent-object'

" ctrlp-filetype: Filetype extension for CtrlP
Plug 'endel/ctrlp-filetype.vim'

" terminalkeys.vim: Terminal Keys settings
Plug 'nacitar/terminalkeys.vim'

" vim-slime: Interaction with tmux/screen
Plug 'jpalardy/vim-slime'

" vim-virtualenv: Virtualenv support
Plug 'jmcantrell/vim-virtualenv'

" gundo: Graph vim undo history
Plug 'sjl/gundo.vim'

" ZoomWin: Toggle window zoom
Plug 'dr-chip-vim-scripts/ZoomWin'

" vim-scratch: Scratch buffer
Plug 'ivanalejandro0/vim-scratch'

" vim-debug: Debugger
Plug 'jabapyth/vim-debug'

" vim-python-pep8-indent: Python pep8 indent
Plug 'hynek/vim-python-pep8-indent'

" vimux: Easy interaction with tmux
Plug 'benmills/vimux'


function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" autocmd! User YouCompleteMe call youcompleteme#Enable()

" Wombat: Colorscheme for gvim
Plug 'Wombat'

" Fisa Colorscheme
Plug 'fisadev/fisa-vim-colorscheme'

" Dockerfile suppoer
Plug 'ekalinin/Dockerfile.vim'

Plug 'freeo/vim-kalisi'

Plug 'nanotech/jellybeans.vim'

call plug#end()


function s:after()
    for f in split(glob('~/.vim/custom/after/*.vim'), '\n')
        exe 'source' f
    endfor
endfunction

autocmd VimEnter * call s:after()
