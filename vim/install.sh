#!/bin/bash
set -e

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo 'Installing Dot Vim from '$dirname
cd $dirname

VIMRC="set runtimepath+=$dirname

source $dirname/vimrcs/basic.vim
source $dirname/vimrcs/extended.vim

try
source $dirname/my_configs.vim
catch
endtry"

IFS=''
echo $VIMRC > ~/.vimrc
unset IFS