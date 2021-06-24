#! /bin/bash

rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.tmux.conf
rm -f ~/.yabairc
rm -f ~/.skhdrc
rm -f ~/.config/alacritty/alacritty.yml
rm -f ~/.config/karabiner/karabiner.json

# Install configs
JDOT_HOME="${HOME}/.config/jdot"

git clone git@github.com:Jtcruthers/dotfiles.git $JDOT_HOME

DOTFILES="${JDOT_HOME}/dotfiles"

ln -s "${DOTFILES}/yabairc" "${HOME}/.yabairc"
ln -s "${DOTFILES}/skhdrc" "${HOME}/.skhdrc"
ln -s "${DOTFILES}/tmux.conf" "${HOME}/.tmux.conf"
ln -s "${DOTFILES}/zshrc" "${HOME}/.zshrc"
ln -s "${DOTFILES}/vimrc" "${HOME}/.vimrc"

mkdir -p ~/.config/alacritty
ln -s "${DOTFILES}/alacritty.yml" ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/karabiner
ln -s "${DOTFILES}/karabiner.json" ~/.config/karabiner/karabiner.json
