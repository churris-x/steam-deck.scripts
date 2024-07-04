#!/bin/bash

echo 'Still WIP, sorry :-('

cd ~

echo 'Create .gitconfig'
if [ ! -L .gitconfig ]; then
    ln -s .scripts/.gitconfig .gitconfig
fi

