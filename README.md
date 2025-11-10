# Caprice Linux Live Builder

This script just makes a live disc out of a given `squashfs` file. To build the whole thing, You need to follow the instructions of this document. This guide is also available in Persian through [this link](https://haghiri75.com/2021/01/08/%DA%86%D8%B7%D9%88%D8%B1-%DB%8C%DA%A9-%D8%AA%D9%88%D8%B2%DB%8C%D8%B9-%D9%84%DB%8C%D9%86%D9%88%DA%A9%D8%B3-%D8%A8%D8%B3%D8%A7%D8%B2%DB%8C%D9%85%D8%9F/).

## Live Disc From a Hard Disk Install

For this, you must install `rsync` (which may be shipped with your Debian/Ubuntu installation) and then run the script `file_gathering.sh` which creates the `chroot` folder from your current Hard Disk installation. The rest goes the same from [this part](#necessary-tools-for-a-live-disc). And do not forget to install `live-boot` package as well.

## Live Disc From a Bootstrapped Install 

### Prerequisties 

You need to have thse packages installed : 

* mtools 
* debootstrap
* xorriso 
* grub-pc 
* squashfs-tools 

And you also need a Debian or Ubuntu host. If you use other types of Debian (such as Devuan, which ships without `systemd`) or other Linux distributions (such as Fedora, OpenSUSE, Arch Linux) do the instructions at your own risk. This steps are tested in an Ubuntu machine and works fine with Debian (with systemd) and Ubuntu. 

### Bootstrapping 

Just clone this repository and go to its directory then create a folder and call it `chroot`, then use the following command to create a bootstrapped installation of the Debian GNU/Linux. 

```
sudo debootstrap --arch=amd64 testing chroot/ http://deb.debian.org/debian
``` 

_NOTE_: You can change the repository to your desired one, as well as the architecture and even the `chroot` directory. 

### Installing the kernel 

After bootstrapping finished, you just need to do this : 

```
sudo chroot chroot/
``` 

_NOTE_: If you use any shells other than `bash` and it's not installed in your `chroot` environment, you need to do `sudo chroot chroot/ /bin/bash` to access the shell without any problems.

After going to the bootstrapped installation shell, you just need to do this : 

```
apt update
apt dist-upgrage 
apt install -y linux-image-amd64
apt install live-boot
``` 

### Necessary tools for a live disc 

After you installed the live disc, what you need is a bunch of tools for editing configuration files, accessing to a network, etc. So, we have to install these packages: 

```
apt install --no-install-recommends -y network-manager net-tools wireless-tools curl openssh-client
```

For now, you have a very basic system which can be used and booted from a bootable medium. 

## Live Disc Customization

It's not a hard thing to do, you can just install everything you want using `chroot`. 

### Important notes 

In case of installing `libreoffice` or any other Java programs, do this before `chroot`ing to the directory : 

```
sudo mount --bind /dev chroot/dev
sudo mount --bind /dev/pts chroot/dev/pts
sudo mount -t proc proc chroot/proc
sudo mount -t sysfs sysfs chroot/sys
``` 

And after you finished your customization/installations, unmount these using `umount` and then go for the ISO. 

## Building the ISO 

### Copying the kernel and init images 

First, just do this : 

```cp chroot/boot/vmlinuz-* isotmp/live/vmlinuz``` 

Then : 

```cp chroot/boot/initrd* isotmp/live/initrd.img``` 

### Final ISO build 

To build an iso, for example for _Caprice Linux_, you just need to execute this command : 

```
./build_image.sh Caprice_Linux.iso isotmp CAPRICELINUX chroot
``` 

## TODO 

- [ ] Providing a script for bootstrapping the system
    - [ ] Debootstrap
    - [x] Hard Disk install
- [ ] Providing a script for installing different desktop environments or window managers. 
- [ ] Providing explanations for `build_image.sh` paramaters (high priority)
- [x] Providing a persian translation for this document. 