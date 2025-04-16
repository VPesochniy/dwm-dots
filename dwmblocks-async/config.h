#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 0

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
    X("  ", "date '+%r'", 1, 0)  \
    X("  ", "pulsemixer --get-volume | awk '{print $NF \"%\"}'", 1, 2)   \
    X("  ", "nmcli device wifi | awk '/^*/ {print $8 \"%\"}'", 5, 0)   \
    X("  ", "xset -q | grep LED | awk '{ if (substr ($10,5,1) == 1) print \"RU\"; else print \"EN\"; }'", 0, 1) \
    X(" ", "brightnessctl info | awk '/Current/ {print $NF}' | sed -e 's/(//' -e 's/)//'", 0, 3)   \
    X(" ", "echo \"$(cat /sys/class/power_supply/BAT0/capacity)%\"", 5, 0) \
    X(" ", "date '+%d.%m '", 1, 0) \
    // X("", "curl wttr.in/Saint-Petersburg\?format=1 | sed -e 's/+//' -e 's/\\ //' -e 's/C/C /'", 1800, 0) \


#endif  // CONFIG_H
