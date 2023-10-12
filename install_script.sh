#!/bin/bash

# Updates system
sudo pacman -Syu

# Most essential program
sudo pacman -S neofetch
# He He. Because you know... I use Arch btw btw

# Essential program install
sudo pacman -S xorg-server xorg-xinit qtile lightdm lightdm-gtk-greeter alacritty git pulseaudio pulseaudio-alsa

# Enables LightDM to start on boot
sudo systemctl enable lightdm

# Enables pulseaudio to start on boot (different session for every user each)
systemctl --user enable pulseaudio

# Clones all configuration files from my GitHub
git clone https://github.com/AdamBurakowski/Linux-Config ~/Linux-Config/

# Moves Vim config to /etc
sudo mv ~/Linux-Config/vimrc /etc/.vimrc

# Moves Qtile config files
sudo mv ~/Linux-Config/config.py ~/.config/qtile/config.py
sudo mv ~/Linux-Config/autostart.sh ~/.config/qtile/autostart.sh

# Moves Lightdm-gtk-greeter config file
sudo mv ~/Linux-Config/lightdm-gtk-greeter.conf /etc/lightdm

sudo mv ~/Linux-Config/picom.conf ~/.config/picom

# Visual enhancement programs (themes, icons, walpapers, etc)
sudo pacman -S arc-gtk-theme papirus-icon-theme lxappearance qt5ct nitrogen

# Installs Firefox and other work tools
sudo pacman -S firefox discord libreoffice-still python thunar

sudo pacman -Scc

echo "Installation complete. Reboot your system to start using the new setup"
