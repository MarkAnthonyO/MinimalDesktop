uninstall() {
	sudo pacman -Rsnc - < req.txt

	rm -r ~/.config/dunst
	rm -r ~/.config/gtk-3.0
	rm -r ~/.config/openbox
	rm -r ~/.config/picom
	rm -r ~/.config/polybar
	rm -r ~/.icons/default/index.theme
}

uninstall