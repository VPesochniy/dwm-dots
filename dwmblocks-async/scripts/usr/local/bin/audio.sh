#!/bin/sh

volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $NF}')
micro=$(wpctl get-volume @DEFAULT_SOURCE@ | awk '{print $NF}')

if [[ $volume = "[MUTED]" ]]; then
    printf "   off "
else
    echo $volume | awk '{printf "   %d%% ", $0 * 100}'
fi

if [[ $micro = "[MUTED]" ]]; then
    printf "   off\n"
else
    echo $micro | awk '{printf "   %d%%\n", $0 * 100}'
fi