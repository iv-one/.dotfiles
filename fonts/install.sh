#!/bin/bash

function install_linux_fonts() {
  mkdir -p ~/.fonts
  pushd ~/.fonts
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hasklig.zip
  unzip Hasklig.zip
  popd
}

function install_darwin_fonts() {
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
  brew install --cask font-hasklug-nerd-font
}

unameout="$(uname -s)"
case "${unameout}" in
Linux*) install_linux_fonts ;;
Darwin*) install_darwin_fonts ;;
esac

echo "✓ fonts"
