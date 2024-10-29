#!/bin/bash

P=$(pwd)

install() {
	sudo pacman -Sy

	sudo pacman -S - <  req.txt
	
	sudo systemctl enable bluetooth
	sudo systemctl enable lightdm
}

download_themes() {
	echo "| Download themes |"
	sleep 2
  	cd /tmp
  	git clone https://github.com/MarkAnthonyO/MinD-theme.git
  	git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
  	git clone https://github.com/vinceliuice/Colloid-icon-theme.git
}

install_for_user_only() {
	cd /tmp/MinD-theme
        ./install.sh

        cd /tmp/Graphite-gtk-theme
        ./install.sh

        cd /tmp/Colloid-icon-theme
        ./install.sh -t all

	mkdir $HOME/.config
	cp -r $P/configs/openbox $HOME/.config

	mkdir ~/.config
  	mkdir ~/.themes
  	mkdir ~/.icons

	cd $P

	cp -r configs/* ~/.config
	cp -r icon/* ~/.icons
}

install_for_all_user() {
	cd /tmp/MinD-theme
  	sudo ./install.sh

	cd /tmp/Graphite-gtk-theme
  	sudo ./install.sh

	cd /tmp/Colloid-icon-theme
  	sudo ./install.sh -t all

	cd $P

	sudo cp -r configs/dunst/ /etc/
	sudo cp -r configs/gtk-3.0/ /etc/
	sudo cp -r configs/openbox/ /etc/xdg/
	sudo cp -r configs/picom/* /etc/xdg/
	sudo cp -r configs/polybar/ /etc/xdg/
	sudo cp -r icon/* /usr/share/icons/
	cp -r configs/Thunar ~/.config
}

install_configs() {

	read -r -p "You want install configurations for all users (Y/n)? " install_resp

	install_resp=$(echo $install_resp | tr '[:upper:]' '[:lower:]')

	if [ $install_resp == $(echo "y") ]; then
        	install_for_all_user

	elif [ $install_resp == $(echo "n") ]; then
        	install_for_user_only

	else
        	echo "Incompatible response"
	fi

}

enable_services() {
	sudo systemctl enable bluetooth
  	sudo systemctl enable lightdm	
}

install

download_themes

install_configs

enable_services
