#!/bin/bash
installDependencies() {
  # Instalation dependencies
  sudo pacman -Sy
  sudo pacman -S - < requirements.txt

  sudo systemctl enable lightdm
  xdg-user-dirs-update
}

copyConfs() {
  # Configurations
  mkdir ~/.config
  mkdir ~/.fonts
  mkdir ~/.themes
  mkdir ~/.icons
  mkdir ~/.local
  mkdir ~/.local/share/
  mkdir ~/.local/share/applications/
  
  # Copy configurations for Desktop environment
  cp -r config/* ~/.config
  sudo cp -r launchers/* /usr/share/applications/

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
