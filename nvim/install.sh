#!/bin/bash

function install_linux_neovim() {
  nix-env -i neovim
}

function install_darwin_neovim() {
  brew install neovim
}

unameout="$(uname -s)"
case "${unameout}" in
Linux*) install_linux_neovim ;;
Darwin*) install_darwin_neovim ;;
esac

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

src="$dirname/init.vim"
dist="$HOME/.config/nvim/init.vim"

rm -f $dist
ln -s $src $dist

echo "✓ nvim"
