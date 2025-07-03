#!/bin/sh

dotfiles="$HOME/dotfiles"
for f in \
  .bashrc .bash_aliases \
  .gitconfig \
  .tmux.conf \
  .zshrc .zshenv \
;do
  echo $f >&2
  ln -sf "$dotfiles/$f" "$HOME/$f"
done

config=${XDG_CONFIG_HOME:-$HOME/.config}

# fish
if [ ! -e "$config/fish" ]; then
  mkdir -p "$config/fish"
  ln -sf $dotfiles/fish $config/fish
fi

# install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
  ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
  mkdir -p "$ZSH_CUSTOM/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi
