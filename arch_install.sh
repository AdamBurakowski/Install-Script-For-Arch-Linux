#!bin/bash

cfdisk /dev/sda

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware vim

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash

pacman -S networkmanager grub

systemctl enable NetworkManager

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

passwd

vim /etc/locale.gen

vim /etc/locale.conf

vim /etc/hostname

ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

exit

unmount -R /mnt

reboot
