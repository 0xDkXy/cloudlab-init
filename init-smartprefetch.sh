#!/bin/bash

#REPO="https://github.com/RutgersCSSystems/crossprefetch-asplos24-artifacts.git"

export DEBIAN_FRONTEND=noninteractive

if [[ -z $1 ]];then
    echo "input nvme device name"
    exit
fi
NVME_DEVICE=$1

cd $HOME
sudo mkfs.ext4 $NVME_DEVICE
mkdir ~/ssd
sudo mount $NVME_DEVICE ~/ssd
cd ~/ssd
sudo chown -R $USER .

# git clone $REPO
# cd crossprefetch-asplos24-artifacts
# 
# source ./scripts/setvars.sh
# scripts/install_packages.sh
# 
# cd $BASE/linux-5.14.0
# ./compile_modified_deb.sh
# 
# 
