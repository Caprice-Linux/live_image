#!/bin/sh

rm -rvf $2/live/filesystem.squashfs
sudo mksquashfs $4 $2/live/filesystem.squashfs

rm -rvf $1
xorriso as mkisofs -r -V $3 -J -l -iso-level 3 -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -eltorito-platform 0xEF -eltorito-boot boot/grub/efi.img -no-emul-boot -o $1 $2 | tee build.log
