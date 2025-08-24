# do it after arch-chroot
pacman -S man-db man-pages texinfo
pacman -S e2fsprogs dosfstools btrfs-progs exfat-utils 
pacman -S networkmanager terminus-font openssh
pacman -S rsync nano git cmake wget unzip unrar
pacman -S --needed base-devel

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >  /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "FONT=ter-v32n" >> /etc/vconsole.conf
echo "archlinux" > /etc/hostname

locale-gen
systemctl enable NetworkManager
mkinitcpio -P
useradd -m -G wheel admin

pacman -Sy grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg

echo "!!!!!!!!!!!!!!"
echo "passwd admin"
echo "EDITOR=nano visudo"
echo "/etc/hostname"

