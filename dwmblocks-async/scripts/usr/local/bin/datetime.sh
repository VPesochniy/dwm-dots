#!/bin/sh

state="/tmp/date_time_state"

if [[ ! -f $state ]]; then
    echo "time" > $state
fi

current_state=$(cat $state)
if [[ $current_state = "date" ]]; then
    echo " $(date +%d.%m) "
else
    echo " $(date +%r) "
fi

case $BLOCK_BUTTON in
    1) echo hi ;;
esac