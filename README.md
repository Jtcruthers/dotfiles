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

Use `stow` to install the dotfiles. 

In the root of this repo, run `stow -v --no-folding dotfiles`

This should link all the dotfiles inside in their correct place. At least it did for me 🤷

Only thing left to do is install catppuccin for Alacritty via their [instructions](https://github.com/catppuccin/alacritty)
