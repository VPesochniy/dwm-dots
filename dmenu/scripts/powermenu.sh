#! /bin/sh

options="Lock\nLogout\nReboot\nShutdown"
selected=$(echo -e $options | dmenu -i -sb "#fabd2f")

if [[ $selected = "Lock" ]]; then betterlockscreen -l
elif [[ $selected = "Logout" ]]; then loginctl terminate-user $USER
elif [[ $selected = "Reboot" ]]; then reboot
elif [[ $selected = "Shutdown" ]]; then poweroff
fi