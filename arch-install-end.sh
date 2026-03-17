# do it after arch-chroot
pacman -S man-db man-pages texinfo
pacman -S e2fsprogs dosfstools exfat-utils 
pacman -S networkmanager terminus-font openssh reflector
pacman -S rsync vim git cmake unzip unrar
pacman -S --needed base-devel

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >  /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "FONT=ter-v32n" >> /etc/vconsole.conf
echo "nucbox" > /etc/hostname

locale-gen
systemctl enable NetworkManager
mkinitcpio -P
useradd -m -G wheel ian

pacman -Sy grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg

echo "!!!!!!!!!!!!!!"
echo "passwd ian"
echo "EDITOR=nano visudo"
echo "after reboot:"
echo "nmcli device wifi list"
echo "nmcli device wifi connect SSID password пароль"
