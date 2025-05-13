#!/bin/sh

bluetooth=$(bluetoothctl info | awk '/Battery/ {print $NF}' | sed -e 's/(//' -e 's/)//')

if [[ $bluetooth = "" ]]; then
    printf ""
else
    echo $bluetooth | awk '{printf "   %d%% ", $0}'
fi

nmcli device wifi | awk '/^*/ {printf "   %d%%\n", $8}'