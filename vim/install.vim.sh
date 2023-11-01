#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rm -Rf ~/.vim
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -u "$dirname/vimrcs/plugins.vim" +PlugInstall +qa < `tty` > `tty`
