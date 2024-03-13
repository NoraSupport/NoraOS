#!/bin/bash

# -------------------------------
# NoraOS installation script
# Author: Machiel Heinen
# Licence: GPL3
# -------------------------------
# Use at own risk!!!
# -------------------------------
# No really, read before you act!
# -------------------------------

LOC=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "$LOC"

# Update pacman and pull base-devel & git
sudo pacman -Syu --needed base-devel git --noconfirm

# Pull all the gits
git clone https://aur.archlinux.org/yay.git $LOC/assets/git/yay
git clone https://github.com/vinceliuice/Orchis-theme $LOC/assets/git/Orchis-theme

# Install yay
cd $LOC/assets/git/yay
makepkg -si
cd $LOC

# Install hyprland and main packages
sudo pacman -S - < $LOC/assets/pkg/pkg.list --noconfirm

# Install AUR packages
yay -S - < $LOC/assets/pkg/pkg_aur.list --noconfirm

# Copy config files
cp -r $LOC/config/* $HOME/.config/

# Copy assets
mkdir -p $HOME/.wallpapers
cp -r $LOC/assets/style/wallpapers/* $HOME/.wallpapers/

# Install theme
sh $LOC/assets/git/Orchis-theme/install.sh -n NoraOS-GTK -t all -l --tweaks macos primary