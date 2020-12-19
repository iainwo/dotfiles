#!/bin/bash

DOTFILES_DIR="${HOME}/dotfiles"

echo "Installing Git..."

if ! command -v git &> /dev/null; then
  sudo apt-get update -y
  sudo apt install -y git
fi

echo "Installing dotfiles repository..."
git clone https://github.com/iainwo/dotfiles.git $DOTFILES_DIR
