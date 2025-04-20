#! /bin/sh

xrandr --output eDP --mode 1920x1080 --rate 60
setxkbmap us,ru -option 'grp:caps_toggle'
feh --bg-fill /home/vpesochniy/wallpapers/wallpaper.jpg
xset r rate 440 40
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

dwmblocks &
/usr/bin/lxpolkit &
sxhkd &
redshift &
flameshot &
libinput-gestures &

while true; do
	dwm 2>~/.dwm.log
done