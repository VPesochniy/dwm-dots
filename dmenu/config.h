/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */

// /////////////////////////////////////////////////////////////////////////////

static int fuzzy  = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching */

// /////////////////////////////////////////////////////////////////////////////

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"JetBrainsMono NF:size=14:style=Bold"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
// static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	// [SchemeNorm] = { "#bbbbbb", "#222222" },
	// [SchemeSel] = { "#eeeeee", "#005577" },
	// [SchemeOut] = { "#000000", "#00ffff" },
// };

// /////////////////////////////////////////////////////////////////////////////

static const char *colors[SchemeLast][2] = {
				/*     	fg         	bg       */
	[SchemeNorm]	= { "#ebdbb2",	"#282828" },
	[SchemeSel]		= { "#1d2021",	"#fabd2f" },
	// [SchemeOut] = { "#ebdbb2", "#3c3836" },
};

// /////////////////////////////////////////////////////////////////////////////

// /* -l option; if nonzero, dmenu uses vertical list with given number of lines */
// static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

// /////////////////////////////////////////////////////////////////////////////

static unsigned int border_width = 3;

// /////////////////////////////////////////////////////////////////////////////

// /////////////////////////////////////////////////////////////////////////////

/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 10;
static unsigned int columns    = 1;

// /////////////////////////////////////////////////////////////////////////////

// /////////////////////////////////////////////////////////////////////////////

static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
static const float menu_height_ratio = 4.0f;  /* This is the ratio used in the original calculation */

// /////////////////////////////////////////////////////////////////////////////