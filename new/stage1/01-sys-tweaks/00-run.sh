#!/bin/bash -e

install -d "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d"
install -m 644 files/noclear.conf "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/noclear.conf"
install -v -m 644 files/fstab "${ROOTFS_DIR}/etc/fstab"

on_chroot << EOF
if ! id -u pi >/dev/null 2>&1; then
	adduser --disabled-password --gecos "" pi
fi

usermod -l master -m -d /home/master pi

userdel irc
userdel gnats
userdel backup
userdel www-data
userdel news
userdel games
userdel lp
userdel uucp

groupdel lp
groupdel news
groupdel uucp
groupdel fax
groupdel voice
groupdel cdrom
groupdel floppy
groupdel tape
groupdel www-data
groupdel operator
groupdel irc
groupdel gnats
#groupdel staff
groupdel plugdev
groupdel games
groupdel audio

echo "master:master" | chpasswd
echo "root:root" | chpasswd
EOF


