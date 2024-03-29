#!/bin/bash

brew install \
  bat \
  fd \
  fzf \
  htop \
  ncdu \
  nnn \
  starship \
  the_silver_searcher \
  tmux \
  vim \
  watch \
  zoxide

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install git-delta

echo "✓ mac"
