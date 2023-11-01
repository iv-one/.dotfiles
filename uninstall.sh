#!/bin/bash

function install_linux() {
  echo "TBD"
}

function install_darwin() {
  ./fonts/uninstall.sh
  ./git/uninstall.sh
  ./starship/uninstall.sh
  ./tmux/uninstall.sh
  ./zsh/uninstall.sh
  ./vim/uninstall.sh
  ./alacritty/uninstall.sh
}

echo "uninstall..."

unameout="$(uname -s)"
case "${unameout}" in
Linux*) install_linux ;;
Darwin*) install_darwin ;;
esac

echo "done"
