#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

unameout="$(uname -s)"
case "${unameout}" in
  linux*)     sed -i 's|color_main="colour[0-9]*"|color_main="colour214"|g' "$dirname/tmux.conf";;
  darwin*)    sed -i '' 's|color_main="colour[0-9]*"|color_main="colour39"|g' "$dirname/tmux.conf";;
esac

src="$dirname/tmux.conf"
dist="$HOME/.tmux.conf"

rm -f $dist
ln -s $src $dist
