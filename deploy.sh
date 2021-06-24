#! /bash/sh

rm -f ~/.yabairc
rm -f ~/.skhdrc
rm -f ~/.tmux.conf
rm -f ~/.config/alacritty/alacritty.xml

# Install configs
ln -s "${HOME}/.config/yabai/yabairc" "${HOME}/.yabairc"
ln -s "${HOME}/.config/yabai/skhdrc" "${HOME}/.skhdrc"
