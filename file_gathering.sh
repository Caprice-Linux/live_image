#!/bin/bash

mkdir chroot

rsync -av --one-file-system  --exclude=/home/* --exclude=/root/* --exclude=/tmp/* --exclude=/sys/* --exclude=/dev/* --exclude=/proc/* --exclude=/var/mail/* --exclude=/var/spool/* --exclude=/var/tmp/*  --exclude=/media/* --exclude=/etc/mtab --exclude=/etc/fstab --exclude=/etc/hosts --exclude=${pwd}/chroot / chroot