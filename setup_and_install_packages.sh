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
packages=("fzf" "curl" "jq" "ffmpeg" "tree" "imagemagick" "renameutils" "xclip" "tldr" "xdotool" "mpv" "variety" "viewnior" "dmenu" "aria2" "yt-dlp" "sxhkd" "sxiv" "gnome-disk-utility" "pdftk" "tidy" "pandoc" "vim" "xorg-xev" "firefox")

# Install packages
for package in "${packages[@]}"; do
    echo "Installing $package..."
    sudo pacman -S --noconfirm "$package"
done

echo "Package installation completed."

cd ~
# installing xtreme download manager
echo "installing xtreme download manager..." && wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz && tar xf xdm-setup-7.2.11.tar.xz && chmod a+x ./install.sh && su -c ./install.sh 
rm xdm-se*.tar.xz readme.txt install.sh

# install appimage manager
wget https://raw.githubusercontent.com/ivan-hc/AM/main/INSTALL && chmod a+x ./INSTALL && sudo ./INSTALL

# it is getting downloaded in the root folder so find a war to change it
# installing piper tts
cd ~
echo "installing piper TTS..."
wget https://github.com/rhasspy/piper/releases/download/v1.2.0/piper_amd64.tar.gz
# extract (will be in piper folder)
tar -xvzf  piper*.gz
# go to folder
cd piper/
# get the language and supporting json
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx.json
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx
# remove the compressed file
rm ~/piper*.gz

# firefox dark reader
firefox https://darkreader.org/
# firefox OLED theme (dark)
firefox "https://addons.mozilla.org/en-US/firefox/addon/oled-with-red-accent/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search"
# online keyboard tester
firefox "https://shawon9324.github.io/apps/keytester/"


# Xfce panel can be set to Always hidden with this command: 
xfconf-query -c xfce4-panel -p /panels/panel-0/autohide-behavior -t uint -s 2 
# set terminal transparency
xfconf-query -c xfce4-terminal -p /background-darkness -s .65
# for dark theme
# window manager > style
xfconf-query -c xfwm4 -p  '/general/theme' -n -t string -s 'Matcha-dark-azul'
# appearance >style
xfconf-query -c xsettings -p  '/Net/ThemeName' -n -t string -s 'Matcha-dark-azul'
# for icons 
# appearance >icons
xfconf-query -c xsettings -p  '/Net/IconThemeName' -n -t string -s 'Papirus-Dark'

# keyboard shortcuts
# win + q  => clip board
xfconf-query -c xfce4-keyboard-shortcuts -p  '/commands/custom/<Super>q' -n -t string -s 'xfce4-clipman-history'
# win + t  => terminal
xfconf-query -c xfce4-keyboard-shortcuts -p  '/commands/custom/<Super>t' -n -t string -s 'xfce4-terminal'
# add taskmanager to ctrl+shift+esc 
xfconf-query -c xfce4-keyboard-shortcuts -p  '/commands/custom/<Primary><Shift>Escape' -n -t string -s 'xfce4-taskmanager'
# add win+4 firefox pvt browsing
xfconf-query -c xfce4-keyboard-shortcuts -p  '/commands/custom/<Super>4' -n -t string -s 'firefox --private-window "youtube.com"'
# add win+e file browser
xfconf-query -c xfce4-keyboard-shortcuts -p  '/commands/custom/<Super>e' -n -t string -s 'exo-open --launch FileManager'
# add win+f open firefox
xfconf-query -c xfce4-keyboard-shortcuts -p  '/commands/custom/<Super>f' -n -t string -s '/usr/bin/firefox'
