#!/bin/bash
sudo pacman -Rsnc - < requirements.txt

rm -r ~/.config/Thunar
rm -r ~/.config/openbox
rm -r ~/.config/picom
rm -r ~/.config/polybar
rm -r ~/.config/pwoff
rm -r ~/.config/sxhkd
rm ~/.fonts/PowerlineExtraSymbols.otf
rm -r ~/.themes/MinD-theme

sudo rm -r /etc/lightdm/
