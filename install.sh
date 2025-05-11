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

# Rename all old directories !! Overwrites existing !!
[ -d "$HYPR_DIR" ] && mv -f "$HYPR_DIR" "$HYPR_DIR.old"
[ -d "$WAYBAR_DIR" ] && mv -f "$WAYBAR_DIR" "$WAYBAR_DIR.old"
[ -d "$KITTY_DIR" ] && mv -f "$KITTY_DIR" "$KITTY_DIR.old"
[ -d "$FONTCONFIG_DIR" ] && mv -f "$FONTCONFIG_DIR" "$FONTCONFIG_DIR.old"

# Place all files from the repo in the required locations
for dir in hypr waybar kitty fontconfig; do
  src="$SCRIPT_DIR/$dir"
  dest="$HOME/.config/$dir"
  mkdir -p "$dest"
  cp -R "$src/." "$dest/"
done

