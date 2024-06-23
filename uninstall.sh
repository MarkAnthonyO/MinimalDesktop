#!/bin/bash
sudo pacman -Rsnc - < requirements.txt

rm -r ~/.config/Thunar
rm -r ~/.config/openbox
rm -r ~/.config/picom
rm -r ~/.config/polybar
rm -r ~/.config/pwoff
rm ~/.fonts/PowerlineExtraSymbols.otf
rm ~/.local/share/applications/AppLauncher.desktop

sudo rm -r ~/.themes/MinD-theme
sudo rm -r ~/.icons/MinD-Cursor
