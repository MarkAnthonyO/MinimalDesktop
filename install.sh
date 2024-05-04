#!/bin/bash
command() {
  # Instalation dependencies
  sudo pacman -Sy
  sudo pacman -S - < requirements.txt

  sudo systemctl enable lightdm
  xdg-user-dirs-gtk-update
  
  # Configurations
  mkdir ~/.config
  mkdir ~/.fonts
  
  # Copy configurations for Desktop environment
  cp -r config/* ~/.config
  
  cd ~/.fonts
  wget https://github.com/ryanoasis/powerline-extra-symbols/raw/master/PowerlineExtraSymbols.otf
}

command
