#! /bin/bash

rm -f ~/.zshrc
rm -f ~/.tmux.conf
rm -f ~/.p10k.zsh
rm -f ~/.gitconfig
rm -f ~/.config/alacritty/alacritty.yml
rm -f ~/.config/nvim/init.vim
rm -f ~/.config/nvim/coc-settings.json

# Install configs
JDOT_HOME="${HOME}/.config/dotfiles"

git clone git@github.com:Jtcruthers/dotfiles.git $JDOT_HOME

ln -s "${JDOT_HOME}/dotfiles/zshrc" ~/.zshrc
ln -s "${JDOT_HOME}/dotfiles/tmux.conf" ~/.tmux.conf
ln -s "${JDOT_HOME}/dotfiles/p10k.zsh" ~/.p10k.zsh
ln -s "${JDOT_HOME}/dotfiles/gitconfig" ~/.gitconfig
ln -s "${JDOT_HOME}/dotfiles/init.vim" ~/.config/nvim/init.vim
ln -s "${JDOT_HOME}/dotfiles/coc-settings.json" ~/.config/nvim/coc-settings.json
ln -s "${JDOT_HOME}/dotfiles/alacritty.yml" ~/.config/alacritty/alacritty.yml
