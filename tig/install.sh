#!/bin/bash

tmp_dir=$(mktemp -d -t setup-XXXXXXXXXX)
pushd $tmp_dir
wget https://github.com/jonas/tig/releases/download/tig-2.5.3/tig-2.5.3.tar.gz
tar -xzvf tig-2.5.3.tar.gz
cd tig-2.5.3
make prefix=/usr/local -j
sudo make install prefix=/usr/local
popd
rm -rf $tmp_dir

echo "✓ tig"
