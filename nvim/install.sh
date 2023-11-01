#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

src="$dirname/init.vim"
dist="$HOME/.config/nvim/init.vim"

rm -f $dist
ln -s $src $dist

echo "✓ nvim"
