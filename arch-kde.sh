sudo pacman -S xorg
sudo pacman -S plasma-meta kde-system-meta
sudo pacman -S ark unrar unzip dolphin-plugins kompare kcharselect kclock kcalc kfind konsole kate print-manager
sudo pacman -S kmag gwenview kcolorchooser kdegraphics-thumbnailers kolourpaint kruler okular spectacle svgpart
sudo pacman -S dragon kio-extras kio-admin kio-fuse baloo-widgets
sudo pacman -S firefox
sudo pacman -S kitty startup-notification

exit
!!!! plasma-wayland-session

    baloo-widgets (provides extra information for Dolphin's Information Panel when the Baloo file indexer is on)
    dolphin-plugins (provides a variety of useful plugins for Dolphin, including ISO mounting)
    ffmpegthumbs (provides video thumbnailing plugin)
    kde-inotify-survey (warns when apps are using all inotify watches and prompts the user to raise it; this can help users understand why Baloo in particular isn't working properly, and offers them a way to fix it)
    kdeconnect-kde (provides remote mobile phone control; also make sure to whitelist its system service in your firewall, if you ship one)
    kdegraphics-thumbnailers (provides PDF thumbnailing plugin, among others)
    kdenetwork-filesharing (provides the Samba file sharing setup wizard)
    kdepim-addons (provides a variety of useful addons for the PIM suite; only needed if you pre-install the PIM suite!)
    kio-admin (provides a safe way to edit files as root)
    kio-extras (provides the thumbnailing engine and many thumbnailing plugins, among other things)
    kio-fuse (provides transparent access to non-KDE apps for files on remote locations)
    kio-gdrive (provides transparent KIO access to Google Drive)
    libappindicator-gtk3 instead of the GTK2 variant for crisp status notifier systray icons. Note that this might break left click activation in the few apps that supported it in libappindicator, such as onboard.
    phonon-vlc (this is the only maintained and supported Phonon backend for KDE apps that use Phonon for their multimedia needs; the alternative phonon-gstreamer has been unmaintained since 2013 and should not be shipped by default, or at all, ideally)
    print-manager (provides the Printers KCM and widget)
    xwaylandvideobridge (exposes Wayland windows to XWayland-using screen sharing apps)


    iio-sensor-proxy (allows automatic screen rotation on Wayland)
    noto-sans (provides the default font used for KDE software)
    noto-color-emoji (provides color emojis)
    maliit-keyboard (provides on-screen keyboard on Wayland)
    power-profiles-daemon (enables the power profile functionality in Plasma. Make sure its systemd service is automatically started when the package is installed!)
    switcheroo-control (provides proper hybrid/multi-GPU detection)
    xdg-desktop-portal-gtk (syncs font settings to Flatpak apps when run in Plasma)
    xsettingsd (GTK theme changes without restart; Flatpak GTK theming; and since 5.27, GTK/X11 HiDPI scaling)
    orca (Screen reader for visually impaired users)
    systemd-coredumpd (Global crash handler for drkonqi. Alternative handlers such as ABRT or apport can be used instead of drkonqi+coredumpd)
    
