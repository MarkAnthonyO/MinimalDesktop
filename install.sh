#!/bin/bash
installDependencies() {
  # Instalation dependencies
  sudo pacman -Sy
  sudo pacman -S - < requirements.txt

  sudo systemctl enable lightdm
  xdg-user-dirs-gtk-update
}

copyConfs() {
  # Configurations
  mkdir ~/.config
  mkdir ~/.fonts
  
  # Copy configurations for Desktop environment
  cp -r config/* ~/.config
  sudo cp global/lightdm/* /etc/lightdm/
}

downloadFont() {
  cd ~/.fonts
  wget https://github.com/ryanoasis/powerline-extra-symbols/raw/master/PowerlineExtraSymbols.otf
}

installDependencies

copyConfs

downloadFont
