#!/bin/bash

apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip 
apt-get install -y python3 python3-pip python-dev python-pip # needed by ultisnip

apt-get remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common

cd /tmp 
git clone https://github.com/neovim/neovim 
git reset --hard v0.3.1
cd neovim
make
make install

cd /tmp
rm -rf /tmp/neovim

# neovim package is needed for neovim to use python
pip3 install neovim

pip2 install pynvim
pip3 install pynvim

gem install neovim
