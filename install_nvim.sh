#!/bin/bash

sudo apt update
sudo apt install curl clang-format ninja-build gettext cmake curl build-essential -y

mkdir -p $HOME/.config
git clone https://github.com/0xDkXy/nvim.git $HOME/.config/nvim


install_from_src () {

    git clone https://github.com/neovim/neovim -b v0.11.0 --depth 1 /tmp/neovim
    cd /tmp/neovim

    make CMAKE_BUILD_TYPE=Release

    sudo make install
}

install_from_bin () {
    NVIM_VERSION_BIN=$1
    NVIM_DIR=$2
    cd /tmp
    curl -L -O https://github.com/neovim/neovim/releases/download/$NVIM_VERSION_BIN/${NVIM_DIR}.tar.gz
    tar -xvpf ${NVIM_DIR}.tar.gz
    cd ${NVIM_DIR}
    #sudo chmod -R 755 .
    sudo cp -r bin/* /usr/bin
    sudo cp -r lib/* /usr/lib
    sudo cp -r share/* /usr/share
    cd /tmp
    sudo rm -rf ${NVIM_DIR}*
}

install_from_bin () {
    URL=$1
    DIR=$2
    CMD=$3
    cd /tmp
    curl -L -O ${URL}
    eval "${CMD}"
    cd ${DIR}
    sudo chmod -R 755 .
    sudo cp -r bin/* /usr/bin
    sudo cp -r lib/* /usr/lib
    sudo cp -r share/* /usr/share
    cd /tmp
    sudo rm -rf ${DIR}*
}

# install_from_src
#install_from_bin v0.10.0 nvim-linux64
#install_from_bin "https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz" "nvim-linux64" "tar -xvpf nvim-linux64.tar.gz"
install_from_bin "https://github.com/clangd/clangd/releases/download/20.1.0/clangd-linux-20.1.0.zip" "clangd_20.1.0" "unzip clangd-linux-20.1.0.zip"
