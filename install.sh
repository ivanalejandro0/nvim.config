#!/bin/bash

cd

DEPS=(
    'build-essential'
    'cmake'
    'exuberant-ctags'
    'git'
    'python-dev'
    'python-pip'
)
DEPS_SYS="${DEPS[@]}"
DEPS_PIP="flake8 jsbeautifier"

echo "The script will install these system dependencies: $DEPS_SYS"
echo
read -p 'Do you want to proceed? (y/n): ' yesno

if [ "$yesno" == "y" ]; then
    sudo apt-get install -y $DEPS_SYS
else
    echo "Not installing system dependencies"
    echo
fi

echo "The script will install these pip dependencies: $DEPS_PIP"
echo
read -p 'Do you want to proceed? (y/n): ' yesno

if [ "$yesno" == "y" ]; then
    pip install --user --upgrade $DEPS_PIP
    pip3 install --user --upgrade $DEPS_PIP
else
    echo "Not installing pip dependencies"
    echo
fi


# In case that you have existing vim configurations
if [[ -d ~/.config/nvim ]]; then
    echo "It seems that you already have a nvim configuration, please move them somewhere else before continue"
    exit 1
fi

git clone https://github.com/ivanalejandro0/vim-configs.git ~/.config/nvim
