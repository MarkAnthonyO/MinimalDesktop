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
  mkdir ~/.themes
  mkdir ~/.icons
  
  # Copy configurations for Desktop environment
  cp -r config/* ~/.config
  sudo cp global/lightdm/* /etc/lightdm/

  chmod +x ~/.config/pwoff/menu.sh
}

downloadFont() {
  cd ~/.fonts
  wget https://github.com/ryanoasis/powerline-extra-symbols/raw/master/PowerlineExtraSymbols.otf
}

downloadCursorTheme() {
  cd ~/.icons
  git clone https://github.com/MarkAnthonyO/MinD-Cursor.git
}

downloadTheme() {
  cd ~/.themes
  git clone https://github.com/MarkAnthonyO/MinD-theme.git
}

installDependencies

copyConfs

downloadFont

downloadTheme

downloadCursorTheme
