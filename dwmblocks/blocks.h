//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	// {" ", "pamixer --get-volume-human",		0,		10},
	{"  ", "date '+%r'",		1,		0},
	{"  ", "nmcli device wifi | awk '/^*/ {print $8 \"%\"}'",		5,		0},
	// {"  ", "xkb-switch",		1,		0},
	{"  ", "xset -q | grep LED | awk '{ if (substr ($10,5,1) == 1) print \"RU\"; else print \"EN\"; }'",		0,		10},
	{" ", "echo \"$(cat /sys/class/power_supply/BAT0/capacity)%\"",		1,		0},
	// {"", "scripts/test",	0,		10},
	{" ", "date '+%d.%m '",	1,		0},
	// {"", "curl wttr.in/Saint-Petersburg\?format=1 | sed -e 's/+//' -e 's/\\ //' -e 's/C/C /'",		1800,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 3;
