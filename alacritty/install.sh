#!/bin/bash

function install_allacrity_linux() {
  echo "Install alacritty from https://github.com/jwilm/alacritty"
}

function install_allacrity_darwin() {
  brew cask install alacritty
  
  dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  
  src="$dirname/alacritty.yml"
  dist="$HOME/.config/alacritty/alacritty.yml"
  
  rm -f $dist
  ln -s $src $dist
}

unameout="$(uname -s)"
case "${unameout}" in
  Linux*)     install_allacrity_linux;;
  Darwin*)    install_allacrity_darwin;;
esac