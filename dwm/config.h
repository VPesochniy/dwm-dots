/* See LICENSE file for copyright and license details. */

/* appearance */
static unsigned int borderpx  = 4;        /* border pixel of windows */
static unsigned int snap      = 24;       /* snap pixel */

// /////////////////////////////////////////////////////////////////////////////

static unsigned int gappx     = 9;        /* gaps between windows */

// /////////////////////////////////////////////////////////////////////////////

static int showbar            = 1;        /* 0 means no bar */
static int topbar             = 1;        /* 0 means bottom bar */
// static const char *fonts[]          = { "JetBrainsMono NF:size=14:style=Bold", "Font Awesome 6 Free:size=14" };
static char font[]				= "JetBrainsMono NF:size=14:style=Bold";
static char dmenufont[]			= "JetBrainsMono NF:size=14:style=Bold";

// /////////////////////////////////////////////////////////////////////////////

// static char normfgcolor[]			= "#ebdbb2";
// static char normbgcolor[]			= "#282828";
// static char normbordercolor[]		= "#3c3836";

// static char selfgcolor[]				= "#fbf1c7";
// static char selbgcolor[]				= "#d65d0e";
// static char selbordercolor[]			= "#d65d0e";

// static const char *colors[][3]      = {
// 		/*               fg         	bg         		border   */
// 		[SchemeNorm] = { normfgcolor, 	normbgcolor, 	normbordercolor },
// 		[SchemeSel]  = { selfgcolor, 	selbgcolor,  	selbordercolor  },
// 	};

static const char *fonts[]          = { font };


static char normfgcolor[]           = "#ebdbb2";
static char normbgcolor[]           = "#282828";
static char normbordercolor[]       = "#32302f";

static char selfgcolor[]            = "#1d2021";
static char selbgcolor[]            = "#d79921";
static char selbordercolor[]        = "#fabd2f";

static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

// /////////////////////////////////////////////////////////////////////////////

// static const char *colors[][3]      = {
// 	/*               fg         bg         border   */
// 	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
// 	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
// };

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      			instance    title       tags mask     isfloating   monitor */
	// { "Alacritty",  		NULL,       NULL,       1 << 0,       0,           -1 },
	{ "jetbrains-idea",  	NULL,       NULL,       1 << 1,       0,           -1 },
	{ "VSCodium",  			NULL,       NULL,       1 << 1,       0,           -1 },
	{ "Thorium-browser",  	NULL,       NULL,       1 << 2,       0,           -1 },
	{ "TelegramDesktop",	NULL,       NULL,       1 << 3,       0,           -1 },
	// { "Thunar",  		NULL,       NULL,       1 << 4,       0,           -1 },
	{ "obsidian",  			NULL,       NULL,       1 << 5,       0,           -1 },
	{ "yandex-music",  		NULL,       NULL,       1 << 6,       0,           -1 },
	{ "obs",  				NULL,       NULL,       1 << 7,       0,           -1 },
	{ "qBittorrent",  		NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static float mfact     = 0.6; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	// { "[F]",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#include <X11/XF86keysym.h>
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-i", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *filemanagercmd[]  = { "thunar", NULL };
static const char *browser[]  = { "thorium-browser", NULL };
static const char *idea[]  = { "intellij-idea-ultimate-edition", NULL };
static const char *code[]  = { "codium", NULL };
static const char *music[]  = { "yandex-music", NULL };
static const char *obsidian[]  = { "obsidian", NULL };
static const char *flameshot[]  = { "flameshot", "gui", NULL };
static const char *locker[]  = {"betterlockscreen", "-l", NULL};
// static const char *flameshot[]  = { "flameshot", "gui", "-r", "-p", "~/screenshots/", "|", "xclip", "-selection", "clipboard", "-t", "image/png", NULL };
static const char *vol_up[]   = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+2%",   NULL };
static const char *vol_down[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-2%",   NULL };
static const char *vol_toggle[] = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle",   NULL };
static const char *mic_toggle[] = { "pactl", "set-source-mute", "@DEFAULT_SOURCE@", "toggle",   NULL };
static const char *bright_up[] = { "brightnessctl", "set", "5+",   NULL };
static const char *bright_down[] = { "brightnessctl", "set", "5-",   NULL };

 

ResourcePref resources[] = {
		{ "font",               STRING,  &font },
		// { "dmenufont",          STRING,  &dmenufont },
		{ "background",       	STRING,  &normbgcolor },
		{ "bordercolor",	    STRING,  &normbordercolor },
		{ "foreground",       	STRING,  &normfgcolor },
		{ "selbackground",      STRING,  &selbgcolor },
		{ "selbordercolor",     STRING,  &selbordercolor },
		{ "selforeground",      STRING,  &selfgcolor },
		{ "borderpx",          	INTEGER, &borderpx },
		{ "gappx",          	INTEGER, &gappx },
		{ "snap",          		INTEGER, &snap },
		{ "showbar",          	INTEGER, &showbar },
		{ "topbar",          	INTEGER, &topbar },
		{ "nmaster",          	INTEGER, &nmaster },
		{ "resizehints",       	INTEGER, &resizehints },
		{ "mfact",      	 	FLOAT,   &mfact },
};


// /* commands spawned when clicking statusbar, the mouse button pressed is exported as BUTTON */
// static const StatusCmd statuscmds[] = {
// 	{ "$BUTTON", 1 },
// };
// static const char *statuscmd[] = { "/bin/sh", "-c", NULL, NULL };


static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_space,  spawn,          {.v = dmenucmd } },
	{ MODKEY,             			XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,             			XK_e,      spawn,          {.v = filemanagercmd } },
	{ MODKEY,             			XK_b,      spawn,          {.v = browser } },
	{ MODKEY,             			XK_i,      spawn,          {.v = idea } },
	{ MODKEY,             			XK_c,      spawn,          {.v = code } },
	{ MODKEY,             			XK_m,      spawn,          {.v = music } },
	{ MODKEY,             			XK_o,      spawn,          {.v = obsidian } },
	{ MODKEY,             			XK_s,      spawn,          {.v = flameshot } },
	{ 0,             				XK_Print,  spawn,          {.v = flameshot } },
	

	{ MODKEY,                       XK_r,      resizekey,    {0} },
	{ MODKEY,                       XK_d,      movekey,    {0} },


	// { MODKEY,                       XK_b,      togglebar,      {0} },

	// { MODKEY,                       XK_q,  setlayout,      {0} },

	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                      	XK_f,	   zoom,           {0} },
	{ Mod1Mask,                    	XK_Tab,    view,           {0} },
	{ MODKEY,    		     	    XK_w,      killclient,     {0} },
	{ MODKEY,             			XK_grave,  quit,           {0} },

	
	{ MODKEY,             			XK_BackSpace,	spawn,      {.v = locker } },
	{ MODKEY,             			XK_Escape,		spawn,      SHCMD("loginctl terminate-user $USER") },


	// { MODKEY,             			XK_t,	   togglefloating, {0} },
	{ MODKEY,             			XK_t,	   floatcentered,  {0} },
	// { MODKEY,                       XK_0,      view,           {.1ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
    { 0, 							XF86XK_AudioRaiseVolume,	spawn, 	{.v = vol_up } },
	{ 0, 							XF86XK_AudioLowerVolume,	spawn, 	{.v = vol_down } },
	{ 0, 							XF86XK_AudioMute,			spawn, 	{.v = vol_toggle } },
	{ 0, 							XF86XK_AudioMicMute,		spawn, 	{.v = mic_toggle } },
	{ 0, 							XF86XK_MonBrightnessUp,		spawn, 	{.v = bright_up } },
	{ 0, 							XF86XK_MonBrightnessDown,	spawn, 	{.v = bright_down } },

	
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	TAGKEYS(                        XK_0,                      9)

// /////////////////////////////////////////////////////////////////////////////
	
	{ MODKEY,                       XK_Tab,	   viewnext,       {0} },
	{ MODKEY|ShiftMask,				XK_Tab,	   viewprev,       {0} },

// /////////////////////////////////////////////////////////////////////////////

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	// { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	// { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	// { ClkClientWin,         MODKEY|ShiftMask,         Button1,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },

	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
	

	// { ClkStatusText,        0,              Button1,        spawn,          {.v = statuscmd } },
	// { ClkStatusText,        0,              Button2,        spawn,          {.v = statuscmd } },
	// { ClkStatusText,        0,              Button3,        spawn,          {.v = statuscmd } },


};
