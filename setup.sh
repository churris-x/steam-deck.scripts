#!/bin/bash
# Written by Fran - 2024
# Create symlinks for all configuration files on ~

echo "$0 will now create symbolic links"

cd ~

if [ ! -L .inputrc  ]; then
    echo 'Creating .inputrc'
    ln -s .scripts/.inputrc .inputrc
fi

if [ ! -L .gitconfig ]; then
    echo 'Creating .gitconfig'
    ln -s .scripts/.gitconfig .gitconfig
fi

if [ ! -L .bash_profile  ]; then
    echo 'Creating .bash_profile'
    ln -s .scripts/.bash_profile .bash_profile
fi

# TODO: create a bashrc profile
# if [ ! -L .bashrc  ]; then
#     echo 'Creating .bashrc'
#     ln -s .scripts/.bashrc .bashrc
# fi

if [ ! -L .bash_aliases ]; then
    echo 'Creating .bash_aliases'
    ln -s .scripts/.bash_aliases .bash_aliases
fi

# TODO: make automatic setup of Konsole theme from scripts
# TODO: also call install script, need to somehow setup pacman... maybe with sudo?
