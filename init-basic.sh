#!/bin/bash
set -x

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

echo "sudo mount $NVME_DEVICE ~/ssd" >> ~/.bashrc

set +x
