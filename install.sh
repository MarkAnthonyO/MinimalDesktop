#!/bin/bash

# Install required dependencies
sudo yes | pacman -S - < requirements.txt

# Copy config files
cp -r "config/openbox/" ~/.config/
cp "config/picom/picom.conf" ~/.config/
cp -r "config/polybar" ~/.config/
cp -r "config/jgmenu" ~/.config/

# Enable ligthdm
sudo systemctl enable lightdm
