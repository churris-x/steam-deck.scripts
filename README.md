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
├── .inputrc        # symlink
├── .bash_aliases   # symlink
├── .bash_profile   # symlink
├── .gitconfig      # symlink
└── .scripts        # this repo
```

## Use
The main thing this repository does is create and manage the general dot files. This is done by creating symbolic links to each of those files in the root folder, so the files can be portable and kept up to date.

- `.inputrc` : sets tab behaviour to be sane
- `.bash_profile` : sources the `.bashrc` and `.aliases` files
- `.bash_aliases` : stores all aliases commands & util functions
- `.gitconfig` : general config such as username

To add aliases simply edit the alias file and run `src` to source it.

## How to setup github password
1. Install KWalletManager
    > This is done because the tool `kwallet-query` does not work.  
    > Firstly open the `Discover` app, search for KWalletManager and install it  
    > You shoul get an error because the version of Plasma the deck uses is 5, while the one it downloads expects version 6  
    > Run the following command to *manually* change which commit you are downloading from. Thank you [u/gmes78](https://www.reddit.com/r/kde/comments/1c4hu5y/cannot_run_kwalletmanager_on_my_steam_deck/)  
    > `flatpak update --commit=cf3a6420de76bed4ead3d5546bd6a9f402af26941d26bafa5be9de3da42bbb98 org.kde.kwalletmanager5`  
    > KWalletManager should run as expected. Congratulation you did the job a ANY version control system should do

2. Configure git
    > In your `.gitconfig` add `credential.heper libsecret`  
    > Make github request your credentials  
    > Shoud be good. Double check on the wallet manager that there is an entry called Git

## How to install packages
1. Enable `/` to be read and write with

```sh
# Disables root read only
sudo steamos-readonly disable
```

2. Set up `pacman`

```sh
sudo pacman-key --init
sudo pacman-key --populate
```

## TODO
- [x] Get git tokens working with default keychain `kwallet-query`. Currently doing a terrible 1 year cache
- [ ] Get Welsh keyboard layout, exactly the same as the MacOS version [1](https://docs.kde.org/stable5/en/plasma-desktop/kcontrol/keyboard/layouts.html) [2](https://discuss.kde.org/t/create-a-new-keyboard-layout/8783/2) [3](https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/blob/master/symbols/br?ref_type=heads#L11)
- [ ] Use super instead of garbage ctrl. This is driving me nuts
- [x] Fix autocomplete bug. First tab results in a terminal bell error. `set show-all-if-ambiguous on`
- [ ] Configure and add my own `Konsole` terminal profile
- [ ] Configure `Konsole` colour scheme and add it here
- [x] Add `Kate` markdown preview plugin
- [ ] Fix `Okular` markdown preview
- [ ] Add `Kate` preferences, plugins and key rebinds to this repo somehow -> `~/.config/katerc`?
- [ ] Fix bash aliases not having autocomplete eg: `gk mas` does note autocompelte to `gk master`
- [ ] Figure out how to automatically install pacakages with pacman
- [ ] Figure out how to install apps with pacman

## N.B.
All of this was cobbled together from my personal bash configs, and as such not all the aliases and commands are tested and working as intended. Please check any code you are running before doing so. Have fun!
