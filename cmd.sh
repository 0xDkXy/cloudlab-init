#!/bin/bash

MOUNT_INFO=$(mount | grep "rootfs\.ext4")

LINUX_DIR='linux-5.15.0/'

VERSION=5.15.178
MODULES_DIR="usr/lib/modules/${VERSION}"

if [[ $(mount | grep 'rootfs\.ext4' | wc -l) != 2 ]]; then
    sudo mount rootfs.ext4 mnt
    sudo mkdir -p mnt/${MODULES_DIR}
    sudo mkdir -p /${MODULES_DIR}
    sudo mount --bind mnt/${MODULES_DIR} /${MODULES_DIR}
fi

_PWD=$(pwd)
cd mnt

bash

cd $_PWD

sudo umount /${MODULES_DIR}
sudo umount mnt
