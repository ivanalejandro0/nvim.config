NeoVim configs
==============

This is where I store my neovim configurations and used plugins. I use them on Linux and OSX, things may break for you, let me know if something need fixing.

You can manually install this or you can trust on the ``install.sh`` script that could be outdated at some point. I recommend you to follow the manual installation step and leaverage the install script to automate it, tweak it as you please.

This configurations won't work on vim mostly because of the file naming (``init.vim`` vs ``.vimrc``) but most of the configurations and code will, so if you want you can copy/paste most of this.


Quick installation
==================

Run the command below, it will download the installer script and run it in your computer.
Note: it will ask for admin password to install the needed dependencies.

::

    wget -qO - https://raw.github.com/ivanalejandro0/vim-configs/master/install.sh | bash

Manual installation
===================

You can install the required dependencies as follows (``apt-get`` works in a debian based distro):

.. code-block:: bash

    $ sudo apt-get install -y git python-pip exuberant-ctags build-essential cmake python-dev
    $ # user space installation
    $ pip install --user --upgrade flake8 neovim
    $ pip3 install --user --upgrade flake8 neovim

Note: you can remove the ``--user`` flag if you want to install the python dependencies system-wide.


After that you need to clone this repository and place it on ``~/config/nvim``:


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
