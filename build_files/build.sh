#!/bin/bash

set -ouex pipefail

# Create symlink before /var/run is created as a non-symlink by a package.
ln -sf ../run /var/run

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y mangohud
dnf5 install -y btop
dnf5 install -y nvim
dnf5 install -y hyfetch
#dnf5 install -y tuigreet
#dnf5 install -y sway alacritty swaylock swayidle swaybg thunar waybar rofi-wayland pavucontrol fontawesome-fonts-all
#dnf5 install -y @kde-desktop-environment
#dnf5 install -y @gnome-desktop
dnf5 remove -y firefox firefox-langpacks
dnf5 remove -y nvtop htop
#dnf5 remove -y foot

# Allow sway to work with Nvidia proprietary drivers
#sed -i 's/Exec=sway/Exec=sway --unsupported-gpu/' /usr/share/wayland-sessions/sway.desktop

# Display Manager selection
#systemctl disable lightdm
#systemctl enable gdm
#systemctl enable greetd
#systemctl enable sddm
