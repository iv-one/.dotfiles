#!/bin/bash

function install_linux() {

}

function install_darwin() {
  ./mac/post-install.sh
}

unameout="$(uname -s)"
case "${unameout}" in
Linux*) install_linux ;;
Darwin*) install_darwin ;;
esac
