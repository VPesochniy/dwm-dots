#!/bin/sh

lang=$(xset q | awk '/LED/ {print (substr($NF, length($NF)-3, 1))}')

if [[ $lang = "1" ]]; then
    printf "    RU\n"
else
    printf "    EN\n"
fi