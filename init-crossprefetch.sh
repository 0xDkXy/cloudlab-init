#!/bin/bash

REPO="https://github.com/RutgersCSSystems/crossprefetch-asplos24-artifacts.git"

export DEBIAN_FRONTEND=noninteractive

DISK=$1

cd $HOME
sudo mkfs.ext4 ${DISK}
mkdir ~/ssd
sudo mount ${DISK} ~/ssd
cd ~/ssd
sudo chown -R $USER .

git clone $REPO
cd crossprefetch-asplos24-artifacts

source ./scripts/setvars.sh
scripts/install_packages.sh

cd $BASE/linux-5.14.0
./compile_modified_deb.sh


