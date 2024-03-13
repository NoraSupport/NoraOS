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

# Define script location
LOC=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "$LOC"

# Pacman go brrrr
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

# Update pacman and pull base-devel & git
sudo pacman -Syu --needed base-devel git --noconfirm

# Pull all the gits
git clone https://aur.archlinux.org/yay.git $LOC/assets/git/yay
git clone https://github.com/vinceliuice/Orchis-theme $LOC/assets/git/Orchis-theme
git clone https://github.com/alexanderjeurissen/ranger_devicons $LOC/assets/git/ranger_devicons

# Install yay
cd $LOC/assets/git/yay
makepkg -si --noconfirm
cd $LOC

# Install hyprland and main packages
sudo pacman -S - < $LOC/assets/pkg/pkg.list --noconfirm

# Install AUR packages
yay -S - < $LOC/assets/pkg/pkg_aur.list --noconfirm

# Copy config files
## Make the folders
mkdir -p $HOME/.config/{hypr,ranger,bpytop}
mkdir -p $HOME/.config/ranger/plugins

## Copy the configs
cp -r $LOC/config/hypr/*.conf $HOME/.config/hypr/
cp -r $LOC/config/bpytop/*.conf $HOME/.config/bpytop/
cp -r $LOC/config/ranger/*.conf $home/.config/ranger/
cp -r $LOC/assets/git/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons
#cp -R $LOC/config/bpytop/* $HOME/.config/bpytop/


# Copy assets
mkdir -p $HOME/.wallpapers
cp -r $LOC/assets/style/wallpapers/* $HOME/.wallpapers/

# Install theme
sh $LOC/assets/git/Orchis-theme/install.sh -n NoraOS-GTK -t all -l --tweaks macos primary