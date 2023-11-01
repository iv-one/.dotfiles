#!/bin/bash

function install_linux_allacrity() {
  echo "Install alacritty from https://github.com/jwilm/alacritty"
}

function install_darwin_allacrity() {
  brew cask install alacritty
  
  dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  
  src="$dirname/alacritty.yml"
  dist="$HOME/.config/alacritty/alacritty.yml"
  
  rm -f $dist
  ln -s $src $dist
}

unameout="$(uname -s)"
case "${unameout}" in
  Linux*)     install_linux_allacrity;;
  Darwin*)    install_darwin_allacrity;;
esac