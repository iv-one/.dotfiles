#!/bin/bash

function install_linux_neovim() {
  wget https://github.com/ivan-dyachenko/starship/files/4009911/x86_64-unknown-linux-gnu.tar.gz
  tar xvzf x86_64-unknown-linux-gnu.tar.gz
  sudo chmod +x x86_64-unknown-linux-gnu
  sudo mv x86_64-unknown-linux-gnu /usr/local/bin/starship
  rm x86_64-unknown-linux-gnu.tar.gz
}

function install_darwin_neovim() {
  wget https://github.com/ivan-dyachenko/starship/files/4009911/x86_64-apple-darwin.tar.gz
  tar xvzf x86_64-apple-darwin.tar.gz
  sudo chmod +x x86_64-apple-darwin
  sudo mv x86_64-apple-darwin /usr/local/bin/starship
  rm x86_64-apple-darwin.tar.gz
}

unameout="$(uname -s)"
case "${unameout}" in
  Linux*)     install_linux_neovim;;
  Darwin*)    install_darwin_neovim;;
esac

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

src="$dirname/starship.toml"
dist="$HOME/.config/starship.toml"

rm -f $dist
ln -s $src $dist
