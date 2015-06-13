if empty(glob('~/.vim/plugged'))
  autocmd VimEnter * PlugInstall
endif

" This code sources all the vim files stored in custom/before
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

" Store and cycle through yanked text strings.
" note: this needs to be loaded before 'surround' since overrides 'S' key mapping
Plug 'maxbrunsfeld/vim-yankstack'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'

" CtrlP plugin: Filetype finder and setter.
Plug 'endel/ctrlp-filetype.vim'

" Matchit: Extended match plugin
" http://www.vim.org/scripts/script.php?script_id=39
Plug 'matchit.zip'

" The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine.
Plug 'honza/vim-snippets'

" MatchTag: Color match html/xml tags
Plug 'gregsexton/MatchTag'

" vim-javascript: Javascript improvements
Plug 'pangloss/vim-javascript'

" auto-pairs: Autoclose feature
Plug 'jiangmiao/auto-pairs'

" misc helper mappings
Plug 'tpope/vim-unimpaired'

" lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'

" tabular: Tabular, the text aligner
Plug 'godlygeek/tabular'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" vim-repeat: Repeating support for plugins
Plug 'tpope/vim-repeat'

" vim-indent-object: Indent Text Object
Plug 'michaeljsmith/vim-indent-object'

" terminalkeys.vim: Terminal Keys settings
Plug 'nacitar/terminalkeys.vim'

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

" Dockerfile suppoer
Plug 'ekalinin/Dockerfile.vim'

" Colorscheme for gvim
Plug 'Wombat'

Plug 'fisadev/fisa-vim-colorscheme'
Plug 'freeo/vim-kalisi'
Plug 'nanotech/jellybeans.vim'

call plug#end()


function s:after()
    " This code sources all the vim files stored in custom/after
    for f in split(glob('~/.vim/custom/after/*.vim'), '\n')
        exe 'source' f
    endfor
endfunction

autocmd VimEnter * call s:after()
