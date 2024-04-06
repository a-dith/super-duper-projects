#!/bin/bash

# Step 1: Install NTP
echo "Installing NTP..."
sudo pacman -S --noconfirm ntp

# Step 2: Turn on NTP
echo "Enabling NTP..."
sudo timedatectl set-ntp true

# Enable fastest mirror
echo "Enabling fastest mirror..."
sudo pacman-mirrors --fasttrack

# Enable parallel download in pacman.conf
echo "Enabling parallel download in pacman.conf..."
sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf

# Update and upgrade
echo "Updating and upgrading..."
sudo pacman -Syyu

# Install additional packages
packages=("fzf" "curl" "jq" "ffmpeg" "tree" "imagemagick" "renameutils" "xclip" "tldr" "xdotool" "mpv" "variety" "viewnior" "dmenu" "aria2" "yt-dlp" "sxhkd" "sxiv" "gnome-disk-utility" "pdftk" "tidy" "pandoc" "vim" "firefox")

# Install packages
for package in "${packages[@]}"; do
    echo "Installing $package..."
    sudo pacman -S --noconfirm "$package"
done

echo "Package installation completed."

# installing xtreme download manager
wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz && tar xf xdm-setup-7.2.11.tar.xz && chmod a+x ./install.sh && su -c ./install.sh && echo "finished installing xtreme download manager"
