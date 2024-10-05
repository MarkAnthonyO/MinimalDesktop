#!/bin/bash
installDependencies() {
  # Instalation dependencies
  echo "| Installing dependecies |"
  sudo pacman -Sy
  sudo pacman -S - < requirements.txt

  sudo systemctl enable bluetooth
  sudo systemctl enable lightdm
  xdg-user-dirs-update
}

copyConfs() {
  # Configurations
  echo "| Configuring for user: $USER |"
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
  echo "| Configuring for user: $USER |"
  cd /tmp
  git clone https://github.com/MarkAnthonyO/MinD-theme.git
  cd /tmp/MinD-theme
  ./install.sh
  
  cd /tmp
  git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
  cd /tmp/Graphite-gtk-theme
  ./install.sh
  
  cd /tmp
  git clone https://github.com/vinceliuice/Colloid-icon-theme.git
  cd /tmp/Colloid-icon-theme
  ./install.sh -t all 
}

installDependencies

copyConfs

downloadTheme

changeConfig
