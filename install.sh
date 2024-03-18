#!/bin/bash

# Install required dependencies
sudo pacman -S - < requirements.txt

# Copy config files
cp -r "config files/openbox/" ~/.config/
