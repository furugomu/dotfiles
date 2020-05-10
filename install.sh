#!/bin/sh

for f in \
  .bashrc .bash_aliases \
  .gitconfig git-prompt.sh \
  .tmux.conf \
  .zshrc .zshenv \
;do
  ln -sf "$HOME/dotfiles/$f" "$HOME/$f"
done

