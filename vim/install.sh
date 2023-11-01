#!/bin/bash
set -e

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