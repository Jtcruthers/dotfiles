# Dotfiles I use

## Description
This repository contains my main dotfiles. It includes configurations for:
- zsh
- neovim
- tmux
- git
- alacritty
- powerlevel10k

Neovim + tmux is configured to work together. The neovim leader key is the default (`\`) and the tmux leader key is `ctrl + \`.


## Installation
Warning: Running the deploy script deletes files. Save them first if you want a backup. 

```sh
./deploy.sh
```

This deletes the dotfiles tracked and replaces them with soft links to the dotfiles in this repository. This means making changes to the files in their respective locations automatically updates the dotfiles in this repository.
