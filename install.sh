#!/bin/sh

for f in \
  .bashrc .bash_aliases \
  .gitconfig \
  .tmux.conf \
  .zshrc .zshenv \
;do
  ln -sf "$HOME/dotfiles/$f" "$HOME/$f"
done
