#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

src="$dirname/alacritty.yml"
dist="$HOME/.config/alacritty/alacritty.yml"

rm -f $dist
ln -s $src $dist
