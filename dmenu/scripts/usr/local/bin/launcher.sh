#!/bin/sh

options="Bluetui\nPulsemixer\nYandex Music"
selected=$(echo -e $options | dmenu -i -sb "#fabd2f")

if [[ $selected = "Bluetui" ]]; then
	st -e bluetui
elif [[ $selected = "Pulsemixer" ]]; then
	st -e pulsemixer
elif [[ $selected = "Yandex Music" ]]; then
	yandex-music
fi