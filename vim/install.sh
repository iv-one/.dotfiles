#!/bin/bash

function install_linux_vim() {
  nix-env -i vim
}

function install_darwin_vim() {
  brew install vim
}

unameout="$(uname -s)"
case "${unameout}" in
  Linux*)     install_linux_vim;;
  Darwin*)    install_darwin_vim;;
esac

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo 'Installing Dot Vim from '$dirname
cd $dirname

VIMRC="set runtimepath+=$dirname

source $dirname/vimrcs/plugins.vim
source $dirname/vimrcs/basic.vim
source $dirname/vimrcs/extended.vim
source $dirname/vimrcs/plugins-config.vim

try
source $dirname/my_configs.vim
catch
endtry"

IFS=''
echo $VIMRC > ~/.vimrc
unset IFS

`$dirname/install.vim.sh`