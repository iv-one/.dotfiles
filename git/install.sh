#!/bin/bash

function install_linux_git {
  sudo apt-get install git -y
  
  nix-env -i tig
  nix-env -i diff-so-fancy
  
  configure_git
}

function install_darwin_git {
  brew install git tig diff-so-fancy
  
  configure_git
}

function configure_git() {
  dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  
  src="$dirname/gitconfig"
  dist="$HOME/.gitconfig"
  
  rm -f $dist
  ln -s $src $dist
}

unameout="$(uname -s)"
case "${unameout}" in
  Linux*)     install_linux_git;;
  Darwin*)    install_darwin_git;;
esac