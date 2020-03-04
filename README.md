# dotfiles
Collection of dotfiles

## Notes to myself in the future:

I've installed the following via homebrew:

* ctags
* exa
* ripgrep
* fzf
* neovim
* bat
* diff-so-fancy


## Installation Notes

```
./install.sh
```

## Updating Brewfile

```
brew bundle dump --describe --force
```

## Installing terminfo
```sh
$ brew install ncurses
$ /usr/local/opt/ncurses/bin/infocmp tmux-256color > ~/tmux-256color.info
$ tic -xe tmux-256color tmux-256color.info
# This creates a compiled entry in ~/.terminfo
$ infocmp tmux-256color | head
```
