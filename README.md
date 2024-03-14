# NoraOS - Arch based Hyprland setup
This hyprland setup is a post-install script for minimal Arch installations. Parts of this setup are from the Hyprdots project, which offers a more sophisticated installation routine. The main difference is that this setup doesn't use the hyprdots-cli in order to change the theming, meaning you can use any theming config for any application without building a new hyprdots-theme.

## How to use
1. Install a minimal Arch Linux setup with GRUB and systemd.
2. Clone repo
3. Check / add / remove stuff in pkg lists to own taste
4. Run `./install.sh`

## Defaults
This installation is light on the additional software packages. Other than required packages for Arch/Hyprland, it ships with the following software:
- Browser - Firefox
- File manager - Nemo
