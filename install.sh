#!/bin/bash

cd

# Install dependencies
apt-get install -y git python-pip exuberant-ctags
pip install flake8 jsbeautifier vim-debug dbgp

# In case that you have existing vim configurations
mkdir ~/.vim.old/
mv .vim .vimrc .viminfo .vim.old/
rmdir ~/.vim.old/  # this will remove the dir if no file was moved into

# Clone repo and symlink the vimrc file
git clone https://github.com/ivanalejandro0/vim-configs.git .vim
ln -s .vim/dot.vimrc .vimrc

