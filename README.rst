Quick installation
==================

Run the command below, it will download the installer script and run it in your computer.
Note: it will ask for admin password to install the needed dependencies.

::

    wget -qO - https://raw.github.com/ivanalejandro0/vim-configs/master/install.sh | bash

Manual installation
===================

You need to install the system dependencies:

* ``git`` to clone the repository.
* ``jsbeautifier`` in order to beautify your javascript code.
* ``flake8`` in order to support python style/syntax checks through Syntastic.
* ``exuberant-ctags`` to allow TagBar and CtrlP to generate tags to display.
* ``build-essential``, ``cmake``, ``python-dev`` to build/run YouCompleteMe.
* In order to use the python/php debugger, you'll need ``vim-debug`` and ``dbgp``.

You can install them as follows (``apt-get`` works in a debian based distro):

.. code-block:: bash

    $ sudo apt-get install -y git python-pip exuberant-ctags build-essential cmake python-dev
    # user-wide installation:
    $ pip install --user --upgrade flake8 jsbeautifier vim-debug dbgp
    # or, system-wide installation:
    $ sudo pip install flake8 vim-debug dbgp


After that you need to clone this repository in the home, name it as ``.vim`` and make a symlink for the ``.vimrc`` file:

.. code-block:: bash

    $ cd
    $ mkdir .vim.old/
    $ mv .vim .vimrc .viminfo .vim.old/  # in case that you have existing vim configurations
    $ git clone https://github.com/ivanalejandro0/vim-configs.git .vim


Plugin list
===========

For a list of plugins used here take a look at `plugins.vim`_ file.

.. _`plugins.vim`: https://github.com/ivanalejandro0/vim-configs/blob/master/plugins.vim


Thanks to
=========

I've got a lot of inspiration from users who share their vim configurations,
here are some of the most relevant for me:

* https://github.com/fisadev/fisa-vim-config
* https://github.com/carlhuda/janus
* https://bitbucket.org/sjl/dotfiles/src/tip/vim/
* https://github.com/skwp/dotfiles/tree/master/vim
