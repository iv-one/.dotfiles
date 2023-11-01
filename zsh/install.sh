#!/bin/bash

dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rm -rf ~/.oh-my-zsh 2> /dev/null
rm -f  ~/.zshrc 2> /dev/null
rm -rf ~/.zsh/zsh-autosuggestions 2> /dev/null

export ZSH="$HOME/.oh-my-zsh"
export ZSH_DOTS="$dirname"

env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" || {
  printf "Error: git clone of oh-my-zsh repo failed\n"
  exit 1
}

git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ln -s $ZSH_DOTS/custom/themes/x-refined.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/x-refined.zsh-theme

echo "export ZSH=\"$HOME/.oh-my-zsh\"" > ~/.zshrc
echo "export ZSH_DOTS=\"$dirname\"" >> ~/.zshrc

echo "" >> ~/.zshrc
cat "$dirname/zshrc" >> ~/.zshrc

