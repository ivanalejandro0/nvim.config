System dependencies
===================

* First of all, you'll need ``git`` to clone the repository.
* You need to install ``flake8`` in order to support python style/syntax checks through Syntastic.
* You need ``exuberant-ctags`` to allow TagBar and CtrlP to generate tags to display.
* In order to use the python/php debugger, you'll need ``vim-debug`` and ``dbgp``.

You can install them as follows (``apt-get`` works in a debian based distro)::

    $ sudo apt-get install exuberant-ctags
    $ sudo pip install flake8
    $ sudo pip install vim-debug dbgp


Installation
============

You need to clone this repository in the home, name it as ``.vim`` and make a symlink for the ``.vimrc`` file::

    $ cd
    $ mv .vim .vim.old; mv .vimrc .vimrc.old  # in case that you have existing vim configurations
    $ git clone https://github.com/ivanalejandro0/vim-configs.git .vim
    $ ln -s .vim/dot.vimrc .vimrc


Plugin list
===========

Plugin manager: `Pathogen <https://github.com/tpope/vim-pathogen>`_

Tree file eplorer: `NERDTree <https://github.com/scrooloose/nerdtree>`_

Magical way to code html: `ZenCoding <https://github.com/mattn/zencoding-vim>`_

Code commenter: `tComment <https://github.com/tomtom/tcomment_vim>`_

Todo manager: `TaskList <http://juan.boxfi.com/vim-plugins/#tasklist>`_

Syntax checker: `Syntastic <https://github.com/scrooloose/syntastic>`_

Class browser: `TagBar <http://majutsushi.github.com/tagbar/>`_

Surrounding text util: `Surround <https://github.com/tpope/vim-surround>`_

Partial pattern explore: `CtrlP <https://github.com/kien/ctrlp.vim>`_

Extended match plugin: `Matchit <http://www.vim.org/scripts/script.php?script_id=39>`_

Non intrusive autocomplete popup: `Autocomplpop <https://bitbucket.org/ns9tks/vim-autocomplpop/>`_

Snippets: `UltiSnips <https://github.com/SirVer/ultisnips>`_

Color match html/xml tags: `MatchTag <https://github.com/gregsexton/MatchTag>`_

Colorscheme for gvim: `Wombat <http://www.vim.org/scripts/script.php?script_id=1778>`_

Colorscheme for vim: `fisa <https://github.com/fisadev/fisa-vim-colorscheme>`_

Javascript improvements: `vim-javascript <https://github.com/pangloss/vim-javascript>`_

Autoclose feature: `auto-pairs <https://github.com/jiangmiao/auto-pairs>`_

Copy history navigation: `yankring <http://www.vim.org/scripts/script.php?script_id=1234>`_

Beautiful status line: `vim-powerline <https://github.com/Lokaltog/vim-powerline>`_

Tabular, the text aligner: `tabular <https://github.com/godlygeek/tabular>`_

Repeating support for plugins: `vim-repeat <https://github.com/tpope/vim-repeat>`_

Indent Text Object: `vim-indent-object <https://github.com/michaeljsmith/vim-indent-object>`_

Filetype extension for CtrlP: `ctrlp-filetype <https://github.com/endel/ctrlp-filetype.vim>`_

Terminal Keys settings: `terminalkeys.vim <https://github.com/nacitar/terminalkeys.vim.git>`_

Interaction with tmux/screen: `vim-slime <https://github.com/jpalardy/vim-slime>`_

Virtualenv support: `vim-virtualenv <https://github.com/jmcantrell/vim-virtualenv.git>`_

Graph vim undo history: `gundo <https://github.com/sjl/gundo.vim.git>`_

Toggle window zoom: `ZoomWin <http://www.drchip.org/astronaut/vim/index.html#ZOOMWIN>`_

Scratch buffer: `vim-scratch <https://github.com/ivanalejandro0/vim-scratch>`_

Debugger: `vim-debug <https://github.com/jabapyth/vim-debug>`_

Python pep8 indent: `vim-python-pep8-indent <https://github.com/hynek/vim-python-pep8-indent>`_

Easy interaction with tmux: `vimux <https://github.com/benmills/vimux>`_
