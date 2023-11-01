#!/bin/bash

nix-env -i tig
nix-env -i diff-so-fancy
nix-env -i ripgrep

nix-env -iA nixpkgs.jq
nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.python35Packages.neovim
nix-env -iA nixpkgs.platinum-searcher

nix-env -iA nixpkgs.glibcLocales
export LOCALE_ARCHIVE="$(readlink ~/.nix-profile/lib/locale)/locale-archive"
