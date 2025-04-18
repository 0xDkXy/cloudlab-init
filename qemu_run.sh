#!/bin/bash

qemu-system-x86_64 \
    -m 36G \
    -kernel ./vmlinuz-5.15.178 \
    -initrd initrd.img-5.15.178 \
    -append "root=/dev/vda rw console=ttyS0" \
    -drive file=rootfs.ext4,format=raw,if=virtio \
    -nographic

