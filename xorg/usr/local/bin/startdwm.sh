#!/bin/sh

xrandr --newmode "1920x1080_69.00"  201.03  1920 2048 2256 2592  1080 1081 1084 1124  -HSync +Vsync
xrandr --addmode eDP-1 "1920x1080_69.00"
xrandr --output eDP-1 --mode "1920x1080_69.00"
setxkbmap us,ru -option 'grp:caps_toggle'
feh --bg-scale ~/wallpapers/509613ldsdl.jpg
xset r rate 300 40
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
rfkill unblock bluetooth

dwmblocks &
/usr/bin/lxpolkit &
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
redshift &
libinput-gestures &
yandex-disk start
numlockx on
picom &

while true; do
	dbus-launch --exit-with-session dwm 2> ~/.dwm.log
done
