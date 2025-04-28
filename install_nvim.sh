#!/bin/bash

sudo apt update
sudo apt install curl clangd clang-format ninja-build gettext cmake curl build-essential -y

install_from_src () {
    mkdir -p $HOME/.config
    git clone https://github.com/0xDkXy/nvim.git $HOME/.config/nvim


    git clone https://github.com/neovim/neovim -b v0.11.0 --depth 1 /tmp/neovim
    cd /tmp/neovim

    make CMAKE_BUILD_TYPE=Release

    sudo make install
}

install_from_bin () {
    cd /tmp
    curl -L -O https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
    tar -xvpf nvim-linux-x86_64.tar.gz
    cd nvim-linux-x86_64
    sudo chmod -R 755 .
    sudo cp -r bin/* /usr/bin
    sudo cp -r lib/* /usr/lib
    sudo cp -r share/* /usr/share
    cd /tmp
    sudo rm -rf nvim-linux-x86_64*
}

install_from_src
