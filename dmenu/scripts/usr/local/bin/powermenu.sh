#!/bin/sh

options="Lock\nLogout\nReboot\nShutdown"
selected=$(echo -e $options | dmenu -i -sb "#fabd2f")

if [[ $selected = "Lock" ]]; then
	betterlockscreen -l
elif [[ $selected = "Logout" ]]; then
	pkill dwm
elif [[ $selected = "Reboot" ]]; then
	loginctl reboot
elif [[ $selected = "Shutdown" ]]; then
	loginctl poweroff
fi