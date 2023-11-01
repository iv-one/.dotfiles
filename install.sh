#!/bin/bash

function install_linux() {
  ./linux/install.sh
  ./fonts/install.sh
  ./git/install.sh
  ./starship/install.sh
  ./tmux/install.sh
  ./zsh/install.sh
  ./vim/install.sh
  ./tig/install.sh
}

function install_darwin() {
  ./mac/install.sh
  ./fonts/install.sh
  ./git/install.sh
  ./starship/install.sh
  ./tmux/install.sh
  ./zsh/install.sh
  ./vim/install.sh
  ./nvim/install.sh
  ./alacritty/install.sh
  ./tig/install.sh
}

unameout="$(uname -s)"
case "${unameout}" in
Linux*) install_linux ;;
Darwin*) install_darwin ;;
esac
