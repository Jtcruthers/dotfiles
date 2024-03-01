#! /bin/bash

# Prompt for confirmation
echo "This script deletes existing config files. Continue?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Installing..."; break;;
        No ) echo "Exiting..."; exit;;
    esac
done

# Install configs
JDOT_HOME="${HOME}/.dotfiles"

if [ -d $JDOT_HOME ]; then
  echo "$JDOT_HOME already exists, skipping repo clone."
else
  echo "Cloning Jtcruthers/dotfiles.git to $JDOT_HOME"
  git clone git@github.com:Jtcruthers/dotfiles.git $JDOT_HOME
fi

echo "Deleting old configs"
rm -f ~/.zshrc
rm -f ~/.tmux.conf
rm -f ~/.p10k.zsh
rm -f ~/.gitconfig
rm -f ~/.config/alacritty/alacritty.yml
rm -f ~/.config/nvim/init.vim
rm -f ~/.config/nvim/coc-settings.json

echo "Adding soft links to configs"
ln -s "${JDOT_HOME}/dotfiles/zshrc" ~/.zshrc
ln -s "${JDOT_HOME}/dotfiles/tmux.conf" ~/.tmux.conf
ln -s "${JDOT_HOME}/dotfiles/p10k.zsh" ~/.p10k.zsh
ln -s "${JDOT_HOME}/dotfiles/gitconfig" ~/.gitconfig
ln -s "${JDOT_HOME}/dotfiles/init.vim" ~/.config/nvim/init.vim
ln -s "${JDOT_HOME}/dotfiles/coc-settings.json" ~/.config/nvim/coc-settings.json
ln -s "${JDOT_HOME}/dotfiles/alacritty.yml" ~/.config/alacritty/alacritty.yml
