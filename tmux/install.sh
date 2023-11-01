#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)     color="colour214";;
  Darwin*)    color="colour39";;
  *)          color="colour202";;
esac

sed -i '' "s|color_main=\"colour[0-9]*\"|color_main=\"$color\"|g" "$dirname/tmux.conf"

src="$dirname/tmux.conf"
dist="$HOME/.tmux.conf"

rm -f $dist
ln -s $src $dist
