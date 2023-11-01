#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

src="$dirname/gitconfig"
dist="$HOME/.gitconfig"

rm -f $dist
ln -s $src $dist
