#!/usr/bin/env bash

# Get the script dir
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# First update wooooo!
sudo pacman -Syu --noconfirm

# Setup Paru AUR Helper
sudo pacman -Syu --needed --noconfirm base-devel
git clone https://aur.archlinux.org/paru.git $HOME/paru
cd $HOME/paru
makepkg -si --noconfirm
cd $HOME

# Time to install some apps
sudo pacman -Syu --needed firefox stow waybar hyprpaper nerd-fonts \
                        ttf-jetbrains-mono-nerd pipewire wireplumber go npm \
                        pavucontrol
paru -Syu --needed wezterm neovim-nightly

# Remove some apps
sudo pacman -Rs kitty

# Some cool stow action
cd $SCRIPT_DIR
cd ../..
stow --ignore="README.md" */
