#!/bin/bash
sudo pacman -Rsnc - < requirements.txt

rm -r ~/.config/Thunar
rm -r ~/.config/dunst
rm -r ~/.config/gtk-3.0
rm -r ~/.config/openbox
rm -r ~/.config/picom
rm -r ~/.config/plank/dock1
rm -r ~/.config/polybar
rm -r ~/.config/pwoff
rm -r ~/.icons/default/index.theme

sudo rm -rf /usr/share/applications/AppLauncher.desktop
sudo rm -r /etc/lightdm/
