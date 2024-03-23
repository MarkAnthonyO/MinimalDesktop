#!/bin/bash
sudo pacman -Rsnc - < requirements.txt

rm -r ~/.config/openbox/
rm ~/.config/picom.conf
