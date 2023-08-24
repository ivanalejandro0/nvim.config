if empty(glob('~/.config/nvim/plugged'))
  autocmd VimEnter * PlugInstall
endif

" This code sources all the vim files stored in custom/before
for f in split(glob('~/.config/nvim/custom/before/*.vim'), '\n')
    exe 'source' f
endfor

call plug#begin('~/.config/nvim/plugged')

" Emmet/ZenCoding: Magical way to code html
Plug 'mattn/emmet-vim'

" tComment: Code commenter
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " update parsers on update
Plug 'nvim-treesitter/playground'

Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Store and cycle through yanked text strings.
" note: this needs to be loaded before 'surround' since overrides 'S' key mapping
" note: disabled temporarily since it overwrites 'gg'
" Plug 'maxbrunsfeld/vim-yankstack'
" to test:
" https://github.com/bfredl/nvim-miniyank

Plug 'machakann/vim-highlightedyank'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine.
Plug 'honza/vim-snippets'

" MatchTag: Color match html/xml tags
" NeoVim has included the functionality for % html/xml tags, but this
" colorizes when over the tag
Plug 'gregsexton/MatchTag'

" Consider this. Always highlights
" https://github.com/Valloric/MatchTagAlways

" Add extra filetypes support
Plug 'ekalinin/Dockerfile.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'peterhoeg/vim-qml'
Plug 'posva/vim-vue'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-markdown'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cespare/vim-toml'

Plug 'jparise/vim-graphql'
" watch out: https://github.com/sheerun/vim-polyglot/issues/236

" Styled-components: syntax highlighting for CSS in JS template strings.
" Unmaintained, see github repo
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" A plugin to color colornames and codes
Plug 'chrisbra/Colorizer'

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

" Auto save documents on change, useful for quick notes
" Plug '907th/vim-auto-save', { 'on': 'AutoSaveToggle' }

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Show a diff via Vim sign column
Plug 'mhinz/vim-signify', { 'on': 'SignifyToggle' }

" vim-repeat: Repeating support for plugins
Plug 'tpope/vim-repeat'

" vim-indent-object: Indent Text Object
Plug 'michaeljsmith/vim-indent-object'

" Toggle window zoom
Plug 'szw/vim-maximizer'

" physics-based smooth scrolling
" Plug 'yuttie/comfortable-motion.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'bmatcuk/coc-stylelintplus', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}

" needs:
" $ rustup component add rls rust-analysis rust-src
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}

Plug 'nanotech/jellybeans.vim'
Plug 'rebelot/kanagawa.nvim'

Plug 'haya14busa/vim-asterisk'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

function s:after()
    " This code sources all the vim files stored in custom/after
    for f in split(glob('~/.config/nvim/custom/after/*.vim'), '\n')
        exe 'source' f
    endfor
endfunction

autocmd VimEnter * call s:after()
