#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

src="$dirname/tmux.conf"
dist="$HOME/.tmux.conf"

rm -f $dist
ln -s $src $dist
