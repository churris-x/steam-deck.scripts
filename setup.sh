#!/bin/bash
# Written by Fran - 2024
# Create symlinks for all configuration files on ~

echo "$0 will now create symbolic links"

cd ~

echo 'Creating .inputrc'
if [ ! -L .inputrc  ]; then
    ln -s .scripts/.inputrc .inputrc
fi

echo 'Creating .gitconfig'
if [ ! -L .gitconfig ]; then
    ln -s .scripts/.gitconfig .gitconfig
fi

echo 'Creating .bash_profile'
if [ ! -L .bash_profile  ]; then
    ln -s .scripts/.bash_profile .bash_profile
fi

echo 'Creating .bash_aliases'
if [ ! -L .bash_aliases ]; then
    ln -s .scripts/.bash_aliases .bash_aliases
fi

# TODO: make automatic setup of Konsole theme from scripts
# TODO: also call install script, need to somehow setup pacman... maybe with sudo?
