#!/bin/bash

sudo apt update
sudo apt install clangd clang-format ninja-build gettext cmake curl build-essential -y

mkdir -p $HOME/.config
git clone https://github.com/0xDkXy/nvim.git $HOME/.config/nvim


git clone https://github.com/neovim/neovim -b v0.11.0 --depth 1 /tmp/neovim
cd /tmp/neovim

make CMAKE_BUILD_TYPE=Release

sudo make install
