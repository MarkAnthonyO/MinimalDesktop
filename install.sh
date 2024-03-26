#!/bin/bash

# Install required dependencies
sudo pacman -S - < requirements.txt

mkdir ~/.config/

# Copy config files
cp "config/" ~/.config/

# Enable ligthdm
sudo systemctl enable lightdm
