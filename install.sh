#!/bin/bash

source ${DOTFILES_DIR:-$HOME/dotfiles}/env/install.sh

echo "Installing Ubuntu packages..."
sudo apt update -y
sudo apt install -y tmux zsh git xclip

echo "Installing Neovim..."
mkdir -p "$TOOLS_NVIM"
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "$TOOLS_NVIM/nvim"
chmod u+x "$TOOLS_NVIM/nvim"
mkdir -p $HOME/.config/nvim/
ln -s $NVIM/init.vim $HOME/.config/nvim/init.vim

echo "Installing Vim Plug..."
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing Tmux..."
ln -s $DOTFILES_DIR/tmux/tmux.conf $HOME/.tmux.conf

echo "Configuring Git User: $GIT_USER with email: $GIT_EMAIL..."
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USER"

echo "Installing zprezto into $PREZTO_INSTALL with config from $PREZTO_CONFIG..."
if [ ! -d $PREZTO_INSTALL ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $PREZTO_INSTALL
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUG
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

for rcfile in $PREZTO_CONFIG/*; do
  if [ ${rcfile: -4} != ".zsh" ]; then
    ln -s "$rcfile" "$HOME/.$(basename $rcfile)"
  fi
done

echo "Using $SHELL - switching to zsh..."
chsh -s $(which zsh)
