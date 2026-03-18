sudo pacman -S xorg
sudo pacman -S plasma-meta kde-system-meta
sudo pacman -S ark unrar unzip dolphin-plugins kompare kcharselect kclock kcalc kfind konsole kate print-manager
sudo pacman -S kmag gwenview kcolorchooser kdegraphics-thumbnailers kolourpaint kruler okular spectacle svgpart
sudo pacman -S dragon kio-extras kio-admin kio-fuse baloo-widgets
sudo pacman -S firefox
sudo pacman -S kitty startup-notification

exit
   27  sudo pacman -S plasma-meta
   29  sudo pacman -S kde-system-meta
   30  sudo pacman -S kde-utilities-meta
   31  sudo pacman -S kde-network-meta
   32  sudo pacman -S vlc
   33  sudo pacman -S gwenview kcolorchooser kdegraphics-thumbnailers kgraphviewer okular ffmpegthumbs dolphin-plugins kompare kitty

exit# 1. Минимальное ядро Plasma (без лишних приложений)
sudo pacman -S plasma-desktop
# 2. Dolphin + полезные расширения
sudo pacman -S dolphin kio-gdrive dolphin-plugins partitionmanager
# 3. Просмотрщик изображений (лёгкий, из KDE)
sudo pacman -S gwenview okular kompare kitty vlc ark kate konsole
# 5. Дополнительные зависимости для превью в Dolphin
sudo pacman -S kdegraphics-thumbnailers ffmpegthumbs kcolorchooser 

