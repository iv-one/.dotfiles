#!/bin/bash

sudo apt-get update && sudo apt-get -y install \
  bat \
  curl \
  fd-find \
  git \
  htop \
  ncdu \
  silversearcher-ag \
  sudo \
  unzip \
  vim \
  wget \
  xz-utils \
  zsh \
  tmux \
  build-essential \
  ncurses-dev

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install \
  --key-bindings \
  --completion \
  --update-rc

sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -f

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -y

echo "✓ linux"
