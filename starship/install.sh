#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

src="$dirname/starship.toml"
dist="$HOME/.config/starship.toml"

rm -f $dist
ln -s $src $dist

echo "✓ starship"
