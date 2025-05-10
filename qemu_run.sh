#!/bin/bash

LINUX_DIR='linux-5.15.0/'

VERSION=5.15.178
MODULES_DIR="usr/lib/modules/${VERSION}"

if [[ $(mount | grep 'rootfs\.ext4' | wc -l) != 0 ]]; then
    sudo umount /${MODULES_DIR}
    sudo umount mnt
fi


qemu-system-x86_64 \
    -smp cores=8 \
    -m 36G \
    -kernel ./vmlinuz-5.15.178 \
    -initrd ./initrd.img-5.15.178 \
    -append "root=/dev/vda rw console=ttyS0 loglevel=6 ignore_loglevel" \
    -drive file=rootfs.ext4,format=raw,if=virtio \
    -nographic

