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
  mkdir ~/.themes
  mkdir ~/.icons
  
  # Copy configurations for Desktop environment
  cp -r config/* ~/.config
  cp -r icon_config/* ~/.icons
  sudo cp -r launchers/* /usr/share/applications/
  sudo cp -r global/* /etc/

  chmod +x ~/.config/pwoff/menu.sh
}

downloadTheme() {
  cd /tmp
  git clone https://github.com/MarkAnthonyO/MinD-theme.git
  cd /tmp/MinD-theme
  sudo ./install.sh
  
  cd /tmp
  git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
  cd /tmp/Graphite-gtk-theme
  sudo ./install.sh
  
  cd /tmp
  git clone https://github.com/vinceliuice/Colloid-icon-theme.git
  cd /tmp/Colloid-icon-theme
  sudo ./install.sh -t all 
}

installDependencies

copyConfs

downloadTheme
