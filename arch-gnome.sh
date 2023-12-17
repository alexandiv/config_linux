sudo pacman -S gnome
sudo pacman -S dconf-editor eog file-roller gedit gnome-notes gnome-terminal gnome-tweaks

echo "Fractional scaling"
echo gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

