#!/bin/bash

function install_linux_allacrity() {
  echo "Install alacritty from https://github.com/jwilm/alacritty"
}

function install_darwin_allacrity() {
  tmp_dir=$(mktemp -d -t setup-XXXXXXXXXX)
  pushd $tmp_dir
  git clone --depth 1 git@github.com:alacritty/alacritty.git
  cd alacritty
  make app -j
  cp -r target/release/osx/Alacritty.app /Applications/
  popd
  rm -rf $tmp_dir

  dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  src="$dirname/alacritty.yml"
  dist="$HOME/.config/alacritty/alacritty.yml"

  rm -f $dist
  ln -s $src $dist
}

unameout="$(uname -s)"
case "${unameout}" in
Linux*) install_linux_allacrity ;;
Darwin*) install_darwin_allacrity ;;
esac

echo "✓ alacritty"
