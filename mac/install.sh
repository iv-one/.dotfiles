#!/bin/bash

brew install \
  bat \
  fd \
  fzf \
  git \
  htop \
  ncdu \
  neovim \
  nnn \
  starship \
  the_silver_searcher \
  tmux \
  vim \
  watch \
  zsh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -y
cargo install git-delta

echo "✓ mac"
