#!/bin/bash

source ${DOTFILES_DIR:-$HOME/dotfiles}/env/install.sh

echo "Installing Ubuntu packages..."
sudo apt-get update -y
sudo apt install -y tmux zsh git

echo "Configuring Git User: $GIT_USER with email: $GIT_EMAIL..."
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USER"

echo "Installing zprezto into $PREZTO_INSTALL with config from $PREZTO_CONFIG..."
if [ ! -d $PREZTO_INSTALL ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $PREZTO_INSTALL
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUG
fi

for rcfile in $PREZTO_CONFIG/*; do
  if [ ${rcfile: -4} != ".zsh" ]; then
    ln -s "$rcfile" "$HOME/.$(basename $rcfile)"
  fi
done

echo "Using $SHELL - switching to zsh..."
chsh -s $(which zsh)
