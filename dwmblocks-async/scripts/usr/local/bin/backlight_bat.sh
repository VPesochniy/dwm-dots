#!/bin/sh

light | awk '{printf "󰃠 %d%% ", $0}'
battery=/sys/class/power_supply/BAT0

if [[ $(cat $battery/status) = "Charging" ]]; then
    cat $battery/capacity | awk '{printf "󰂄  %d%%\n", $0}'
else
    cat $battery/capacity | awk '{printf "󰁹  %d%%\n", $0}'
fi