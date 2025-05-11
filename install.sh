#!/bin/bash

# Some env stuff
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Install required packages
sudo pacman -S --noconfirm --needed hyprland hyprpaper hyprlock waybar swaync nm-applet
# Some fonts as well
sudo pacman -S --noconfirm --needed ttf-nerd-fonts-symbols freetype2 fontconfig cairo libxft ttf-jetbrains-mono-nerd

# Clear any existing directories
HYPR_DIR=~/.config/hypr
WAYBAR_DIR=~/.config/waybar
KITTY_DIR=~/.config/kitty
FONTCONFIG_DIR=~/.config/fontconfig

# Rename all old directories !! Overwrites exisiting !!
mv $HYPR_DIR $HYPER_DIR.old
mv $WAYBAR_DIR $WAYBAR_DIR.old
mv $KITTY_DIR $KITTY_DIR.old
mv $FONTCONFIG_DIR $FONTCONFIG_DIR.old

# Place all files from the repo in the required locations
cp -R $SCRIPT_DIR/hypr $HYPR_DIR
cp -R $SCRIPT_DIR/waybar $WAYBAR_DIR
cp -R $SCRIPT_DIR/kitty $KITTY_DIR
cp -R $SCRIPT_DIR/fontconfig $FONTCONFIG_DIR
