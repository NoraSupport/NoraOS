#!/usr/bin/env bash

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

# Install yay
cd $LOC/assets/git/yay
makepkg -si
cd $LOC

# Install hyprland and main packages
sudo pacman -S - < $LOC/assets/pkg/pkg.list --noconfirm

# Install AUR packages
yay -S - < $LOC/assets/pkg/pkg_aur.list --noconfirm
