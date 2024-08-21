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

## Use
The main thing this repository does is create and manage three general dot files, `.profile`, `.aliases` and `.gitconfig`. This is done by creating symbolic links to each of those files in the root folder, so the files can be portable and kept up to date.

- `.profile` : for now just sources the `.aliases` file
- `.aliases` : stores all aliases commands & functions (see below how functions work)
- `functions/` : folder for script files that work as aliases
- `.gitconfig` : general config such as username

To add aliases simply edit the alias file and run `src` to source it.

## TODO
- [ ] Get git tokens working with default keychain `kwallet-query`. Currently doing a terrible 1 year cache
- [ ] Get Welsh keyboard layout, exactly the same as the MacOS version [1](https://docs.kde.org/stable5/en/plasma-desktop/kcontrol/keyboard/layouts.html) [2](https://discuss.kde.org/t/create-a-new-keyboard-layout/8783/2) [3](https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/blob/master/symbols/br?ref_type=heads#L11)
- [ ] Use super instead of garbage ctrl. This is driving me nuts
- [x] Fix autocomplete bug. First tab results in a terminal bell error. `set show-all-if-ambiguous on`
- [ ] Configure and add my own `Konsole` terminal profile
- [ ] Configure `Konsole` colour scheme and add it here
- [x] Add `Kate` markdown preview plugin
- [ ] Fix `Okular` markdown preview
- [ ] Add `Kate` preferences, plugins and key rebinds to this repo somehow -> `~/.config/katerc`?

## N.B.
All of this was cobbled together from my personal bash configs, and as such not all the aliases and commands are tested and working as intended. Please check any code you are running before doing so. Have fun!
