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
sudo pacman -Syu --needed --noconfirm firefox stow waybar hyprpaper nerd-fonts \
                        ttf-jetbrains-mono-nerd pipewire wireplumber go npm \
                        pavucontrol blueman brightnessctl
paru -Syu --needed --noconfirm wezterm-git neovim-nightly

# Remove some apps
sudo pacman --noconfirm -Rs kitty vim

# Some cool stow action
cd $SCRIPT_DIR
cd ../..
stow --adopt --ignore="README.md" */
# Restores the original symlinks previously overwritten by --adopt
git restore .

# Fix packer
cd $HOME
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Makes bluetooth work
sudo systemctl enable --now bluetooth
