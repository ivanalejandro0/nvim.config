if empty(glob('~/.config/nvim/plugged'))
  autocmd VimEnter * PlugInstall
endif

" This code sources all the vim files stored in custom/before
for f in split(glob('~/.config/nvim/custom/before/*.vim'), '\n')
    exe 'source' f
endfor

call plug#begin('~/.config/nvim/plugged')

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Emmet/ZenCoding: Magical way to code html
Plug 'mattn/emmet-vim'

" tComment: Code commenter
Plug 'tomtom/tcomment_vim'

" Neomake: async syntax checker
" Plug 'benekastah/neomake'
Plug 'w0rp/ale'

" TagBar: Class browser
" Plug 'majutsushi/tagbar'

" Store and cycle through yanked text strings.
" note: this needs to be loaded before 'surround' since overrides 'S' key mapping
" note: disabled temporarily since it overwrites 'gg'
" Plug 'maxbrunsfeld/vim-yankstack'
" to test:
" https://github.com/bfredl/nvim-miniyank

Plug 'machakann/vim-highlightedyank'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Fuzzy file, buffer, mru, tag, etc finder.
" Plug 'ctrlpvim/ctrlp.vim'

" CtrlP plugin: Filetype finder and setter.
" Plug 'endel/ctrlp-filetype.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine.
Plug 'honza/vim-snippets'

" MatchTag: Color match html/xml tags
Plug 'gregsexton/MatchTag'

" Add extra filetypes support
Plug 'ekalinin/Dockerfile.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'keith/tmux.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'peterhoeg/vim-qml'
Plug 'posva/vim-vue'
Plug 'stephpy/vim-yaml'

Plug 'jparise/vim-graphql'
" watch out: https://github.com/sheerun/vim-polyglot/issues/236

" auto-pairs: Autoclose feature
Plug 'jiangmiao/auto-pairs'

" misc helper mappings
Plug 'tpope/vim-unimpaired'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tabular: Tabular, the text aligner
Plug 'godlygeek/tabular'
" consider: https://github.com/junegunn/vim-easy-align

" A better :join
" Plug "sk1418/Join"

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Show a diff via Vim sign column
Plug 'mhinz/vim-signify', { 'on': 'SignifyToggle' }

" vim-repeat: Repeating support for plugins
Plug 'tpope/vim-repeat'

" vim-indent-object: Indent Text Object
Plug 'michaeljsmith/vim-indent-object'

" terminalkeys.vim: Terminal Keys settings
" Plug 'nacitar/terminalkeys.vim'

" vim-virtualenv: Virtualenv support
Plug 'jmcantrell/vim-virtualenv'

" gundo: Graph vim undo history
Plug 'sjl/gundo.vim'

" ZoomWin: Toggle window zoom
" Plug 'dr-chip-vim-scripts/ZoomWin'
Plug 'troydm/zoomwintab.vim'

" vim-scratch: Scratch buffer
Plug 'ivanalejandro0/vim-scratch'

" vimux: Easy interaction with tmux
Plug 'benmills/vimux'

" BuildYCM function defined on custom/before/youcompleteme.vim
" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-jedi'

" Needs: `go get -u github.com/nsf/gocode`
Plug 'zchee/deoplete-go', { 'do': 'make'}

" ack/ag integration
Plug 'mileszs/ack.vim'

" Plug 'fisadev/fisa-vim-colorscheme'
" Plug 'freeo/vim-kalisi'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'

call plug#end()


function s:after()
    " This code sources all the vim files stored in custom/after
    for f in split(glob('~/.config/nvim/custom/after/*.vim'), '\n')
        exe 'source' f
    endfor
endfunction

autocmd VimEnter * call s:after()
