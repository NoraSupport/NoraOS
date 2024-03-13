# NoraOS installation script
# Author: Machiel Heinen
# Licence: GPL3
# -------------------------------
# Use at own risk!!!
# -------------------------------
# No really, read before you act!
# -------------------------------

# Update pacman and pull base-devel & git
sudo pacman -Syu --needed base-devel git

# Pull all the gits
git clone https://aur.archlinux.org/yay.git $HOME/git-clones/yay

# Install yay
(cd $HOME/git-clone/yay && makepkg -si)

# Install hyprland and main packages
sudo pacman -S < pacman.list

# Install AUR packages
yay -S < aur.list
