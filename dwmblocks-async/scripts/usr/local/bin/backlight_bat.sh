#!/bin/sh

light | awk '{printf "󰃠 %d%% ", $0}'
cat /sys/class/power_supply/BAT0/capacity | awk '{printf "󰁹  %d%%\n", $0}'