#!/bin/bash

# Install required dependencies
sudo pacman -S - < requirements.txt

mkdir ~/.config/

# Copy config files
cp -r "config/openbox" ~/.config/
cp -r "config/jgmenu" ~/.config/

# Enable ligthdm
sudo systemctl enable lightdm
