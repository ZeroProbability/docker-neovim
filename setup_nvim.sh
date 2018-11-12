#!/bin/bash

apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip 
apt-get install -y python3 python3-pip # needed by ultisnip

apt-get remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common

cd /tmp 
git clone https://github.com/neovim/neovim 
git reset --hard v0.3.0
cd neovim
make
make install

