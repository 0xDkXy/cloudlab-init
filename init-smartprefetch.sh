#!/bin/bash

set -x
REPO="git@github.com:RutgersCSSystems/SmartPrefetch.git"

export DEBIAN_FRONTEND=noninteractive

if [[ -z $1 ]];then
    echo "input nvme device name"
    exit
fi
NVME_DEVICE=$1

./init-basic.sh $NVME_DEVICE

cd $HOME
cd ssd

git clone $REPO -b prefetch
cd SmartPrefetch
source ./scripts/setvars.sh

#./scripts/compile_kernel_install.sh
#./scripts/compile_kernel.sh
./scripts/compile_kernel_install_new.sh

set +x
