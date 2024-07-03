# Steam Deck .scripts

This is a collection of scripts and dotfiles for the Steam Deck

## Getting started
1. Clone this repository using git
```sh
git clone https://github.com/churris-x/steam-deck.scripts .scripts
```
2. Run setup.sh script
```sh
sh .scripts/setup.sh
```
3. Your home directory `~/` should have the following files
```sh
[~]$ tree -a -L 1
.
├── .aliases        # symlink
├── .gitconfig      # symlink
├── .profile        # symlink
└── .scripts        # this repo
```

## N.B.
All of this was cobbled together from my personal bash configs, and as such not all the aliases and commands are tested and working as intended. Please check any code you are running before doing so. Have fun!
