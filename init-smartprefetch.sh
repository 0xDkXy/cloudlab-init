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
cd ssh

git clone $REPO -b prefetch
cd SmartPrefetch
source ./scripts/setvars.sh
./scripts/install_packages.sh
./scripts/compile_kernel.sh
# cd crossprefetch-asplos24-artifacts
# 
# source ./scripts/setvars.sh
# scripts/install_packages.sh
# 
# cd $BASE/linux-5.14.0
# ./compile_modified_deb.sh
# 
# 
set +x
