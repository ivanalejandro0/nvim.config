#!/bin/bash

cd

# Install dependencies
sudo apt-get install -y git python-pip exuberant-ctags
pip install --user flake8 jsbeautifier vim-debug dbgp

# In case that you have existing vim configurations
if [[ -d ~/.vim/ || -f .vimrc || -f .viminfo ]]; then
    mkdir ~/.vim.old/
    mv .vim .vimrc .viminfo .vim.old/
fi

# Clone repo and symlink the vimrc file
git clone https://github.com/ivanalejandro0/vim-configs.git .vim
ln -s .vim/dot.vimrc .vimrc
