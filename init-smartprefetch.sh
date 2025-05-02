#!/bin/bash

set -x
REPO_SSH="git@github.com:RutgersCSSystems/SmartPrefetch.git"
REPO_HTTP="https://github.com/RutgersCSSystems/SmartPrefetch.git"

export DEBIAN_FRONTEND=noninteractive

if [[ -z $1 ]];then
    echo "input nvme device name"
    exit
fi
NVME_DEVICE=$1

./init-basic.sh $NVME_DEVICE

cd $HOME
cd ssd

git clone $REPO_HTTP -b prefetch
cd SmartPrefetch

git remote remove origin
git remote add origin ${REPO_SSH}

source ./scripts/setvars.sh
./deps.sh

#./scripts/compile_kernel_install.sh
#./scripts/compile_kernel.sh
./scripts/compile_kernel_install_new.sh

set +x
