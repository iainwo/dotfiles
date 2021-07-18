#!/bin/bash

source ${DOTFILES_DIR:-$HOME/dotfiles}/env/install.sh
source ${DOTFILES_DIR:-$HOME/dotfiles}/env/profiles/${PROFILE:-minimal}.sh

echo "Installing Ubuntu packages..."
sudo apt update -y
sudo apt install -y tmux zsh git xclip tree

echo "Installing Neovim..."
mkdir -p "$TOOLS_NVIM"
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "$TOOLS_NVIM/nvim"
chmod u+x "$TOOLS_NVIM/nvim"
mkdir -p $HOME/.config/nvim/
ln -s $NVIM/init.vim $HOME/.config/nvim/init.vim

if [ -n "$INSTALL_KUBERNETES" ]; then
  echo "Installing kubectl..."
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl

  echo "Installing kustomize..."
  curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
  chmod +x ./kustomize
  sudo mv ./kustomize /usr/local/bin/kustomize
fi

if [ -n "$INSTALL_DOCTL" ]; then
  snap install doctl
fi



if [ -n "$INSTALL_AZURE" ]; then
  echo "Installing Azure CLI..."
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

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
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --no-update-rc
fi

for rcfile in $PREZTO_CONFIG/*; do
  if [ ${rcfile: -4} != ".zsh" ]; then
    ln -s "$rcfile" "$HOME/.$(basename $rcfile)"
  fi
done

echo "Installing Tmux plugins..."
$HOME/.tmux/plugins/tpm/bin/install_plugins all
$HOME/.tmux/plugins/tpm/bin/update_plugins all

echo "Installing Neovim plugins..."
nvim +PlugInstall +qall > /dev/null


if [ -n "$INSTALL_PYTHON" ]; then
  echo "Installing miniconda..."
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p $HOME/miniconda
fi

if [ -n "$INSTALL_GOLANG" ]; then
  echo "Installing Go..."
  wget -O /tmp/go.tar.gz -c https://golang.org/dl/go1.15.7.linux-amd64.tar.gz
  tar -C /usr/local -xzf /tmp/go.tar.gz
fi

echo "Installing extras..."
if [ -n "$INSTALL_JEKYLL" ]; then
  echo "Installing Jekyll..."
  sudo apt-get -y install ruby-full build-essential zlib1g-dev
  gem install jekyll bundler
fi

echo "Using $SHELL - switching to zsh..."
chsh -s $(which zsh)
