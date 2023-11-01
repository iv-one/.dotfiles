#!/bin/bash

function uninstall_linux_fonts() {
  echo "TBD"
}

function uninstall_darwin_fonts() {
  brew uninstall --cask font-hack-nerd-font
}

unameout="$(uname -s)"
case "${unameout}" in
Linux*) uninstall_linux_fonts ;;
Darwin*) uninstall_darwin_fonts ;;
esac

echo "✓ fonts"
