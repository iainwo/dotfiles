#!/bin/bash

DOTFILES_DIR="${HOME}/dotfiles"

echo "Installing Ubuntu packages..."
sudo apt-get update -y
sudo apt install -y tmux zsh git

echo "Scaffolding dotfiles directory..."
mkdir -p $DOTFILES_DIR


echo "Installing zprezto..."
export ZPREZTO_DIR="${DOTFILES_DIR}/.zprezto"
if [ ! -d $ZPREZTO_DIR ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$DOTFILES_DIR/.zprezto"
fi

for rcfile in $(find $ZPREZTO_DIR/runcoms/ -type f -not -name "README.md" -print);do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"
done

echo "Using $SHELL - switching to zsh..."
chsh -s $(which zsh)
