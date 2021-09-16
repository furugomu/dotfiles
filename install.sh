#!/bin/sh

dotfiles="$HOME/dotfiles"
for f in \
  .bashrc .bash_aliases \
  .gitconfig git-prompt.sh \
  .tmux.conf \
  .zshrc .zshenv \
;do
  echo $f >&2
  ln -sf "$dotfiles/$f" "$HOME/$f"
done

# fish
mkdir -p $HOME/.config
echo fish
ln -sf $dotfiles/fish $HOME/.config/fish
