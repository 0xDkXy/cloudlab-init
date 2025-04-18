#!/bin/bash

mkdir -p $HOME/.config
git clone git@github.com:0xDkXy/nvim.git $HOME/.config/nvim

sudo apt install
sudo apt-get install ninja-build gettext cmake curl build-essential -y

git clone https://github.com/neovim/neovim -b v0.11.0 --depth 1 /tmp/neovim
cd /tmp/neovim

make CMAKE_BUILD_TYPE=Release

sudo make install
