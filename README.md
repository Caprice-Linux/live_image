# Sana Desktop Live Builder

This script just makes a live disc out of a given `squashfs` file. To build the whole thing, You need to follow the instructions of this document. 

## Live Disc From a Hard Disk Install

TO BE COMPLETED

## Live Disc From a Bootstrapped Install 

### Prerequisties 

You need to have thse packages installed : 

* mtools 
* debootstrap
* xorriso 
* grub-pc 
* squashfs-tools 

And you also need a Debian or Ubuntu host. If you use other types of Debian (such as Devuan, which ships without `systemd`) or other Linux distributions (such as Fedora, OpenSUSE, Arch Linux) do the instructions at your own risk. This steps are tested in an Ubuntu machine and works fine with Debian (with systemd) and Ubuntu. 