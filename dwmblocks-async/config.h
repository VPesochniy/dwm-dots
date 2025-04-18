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
    X("   ", "xset q | awk '/LED/ { if ( substr($NF, length($NF)-3, 1) == 1) print \"RU\" ; else print \"EN\"}'", 0, 1) \
    X("   ", "wpctl get-volume @DEFAULT_SINK@ | awk '{if ($NF == \"[MUTED]\") print \"off\" ; else print $NF * 100 \"%\"}'", 1, 2)   \
    X("   ", "wpctl get-volume @DEFAULT_SOURCE@ | awk '{if ($NF == \"[MUTED]\") print \"off\" ; else print $NF * 100 \"%\"}'", 1, 4)   \
    X("   ", "bluetoothctl info | awk '/Battery/ {print $NF}' | sed -e 's/(//' -e 's/)/%/'", 1, 0)   \
    X("   ", "nmcli device wifi | awk '/^*/ {print $8 \"%\"}'", 5, 0)   \
    X(" ", "date '+%d.%m'", 1, 0) \
    X("󰃠 ", "brightnessctl info | awk '/Current/ {print $NF}' | sed -e 's/(//' -e 's/)//'", 0, 3)   \
    X("󰁹  ", "echo \"$(cat /sys/class/power_supply/BAT0/capacity)% \"", 5, 0) \


#endif  // CONFIG_H
