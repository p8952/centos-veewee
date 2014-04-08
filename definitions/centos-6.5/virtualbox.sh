#!/usr/bin/env bash

yum -y install gcc kernel-devel-$(uname -r) perl
mount -o loop VBoxGuestAdditions_4.2.22.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
