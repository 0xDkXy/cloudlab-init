#!/bin/bash

sudo apt update
sudo apt install -y debootstrap yes

IMAGE_SIZE=20

fallocate -l  ${IMAGE_SIZE}G rootfs.ext4

yes | mkfs.ext4 rootfs.ext4
mkdir -p mnt

sudo mount rootfs.ext4 mnt
sudo debootstrap --arch=amd64 jammy mnt http://archive.ubuntu.com/ubuntu/

sudo chroot mnt /bin/bash -c "apt update && apt install -y build-essential"
