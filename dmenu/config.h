
static int topbar						= 1;	/* if 0, dmenu appears at bottom	*/
static int fuzzy						= 1;	/* if 0, dmenu doesn't use fuzzy matching */

static unsigned int border_width		= 3;
static unsigned int lines				= 10;
static unsigned int columns				= 1;

static int centered						= 1;	/* centers dmenu on screen */
static int min_width 					= 500;	/* minimum width when centered */

static const float menu_height_ratio 	= 4.0f;	/* This is the ratio used in the original calculation */
static const char *prompt				= NULL;	/* prompt to the left of input field */
static const char worddelimiters[] 		= " ";

static char font[]						= "JetBrainsMono Nerd Font:size=14:style=Bold";
static const char *fonts[]				= { font, "Noto Color Emoji:size=13:style=Regular" };

static const char *colors[SchemeLast][2] = {
	/*					fg			bg			*/
	[SchemeNorm]	= {	"#ebdbb2",	"#282828"	},
	[SchemeSel]		= {	"#1d2021",	"#fabd2f"	},
};