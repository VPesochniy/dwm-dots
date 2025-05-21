/* appearance */
static unsigned int borderpx	= 4;	/* border pixel of windows */
static unsigned int snap		= 24;	/* snap pixel */
static unsigned int gappx		= 9;	/* gaps between windows */
static int showbar				= 1;	/* 0 means no bar */
static int topbar				= 1;	/* 0 means bottom bar */

static char font[]				= "JetBrainsMono Nerd Font:size=14:style=Bold";
static const char *fonts[]		= { font, "Noto Color Emoji:size=14:style=Regular" };

static char normfgcolor[]		= "#ebdbb2";
static char normbgcolor[]		= "#282828";
static char normbordercolor[]	= "#32302f";

static char selfgcolor[]		= "#1d2021";
static char selbgcolor[]		= "#d79921";
static char selbordercolor[]	= "#fabd2f";

static char *colors[][3] = {
	/*				fg				bg				border			*/
	[SchemeNorm] = { normfgcolor,	normbgcolor,	normbordercolor },
	[SchemeSel]  = { selfgcolor,	selbgcolor,		selbordercolor  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class				instance	title		tags mask		isfloating	monitor	*/
	{ "jetbrains-idea",		NULL,		NULL,		1 << 1,			0,			-1		},
	{ "VSCodium",			NULL,		NULL,		1 << 1,			0,			-1		},
	{ "Thorium-browser",	NULL,		NULL,		1 << 2,			0,			-1		},
	{ "TelegramDesktop",	NULL,		NULL,		1 << 3,			0,			-1		},
	{ "obsidian",			NULL,		NULL,		1 << 4,			0,			-1		},
	{ "yandex-music",		NULL,		NULL,		1 << 6,			0,			-1		},
	{ "qBittorrent",		NULL,		NULL,		1 << 7,			0,			-1		},
};

/* layout(s) */
static float mfact				= 0.55;	/* factor of master area size [0.05..0.95] */
static int nmaster				= 1;	/* number of clients in master area */
static int resizehints			= 0;	/* 1 means respect size hints in tiled resizals */
static const int lockfullscreen	= 1;	/* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol	arrange function	*/
	{ "[T]",	tile 				},	/* first entry is default */
	{ "[M]",	monocle 			},
};

/* key definitions */
#include <X11/XF86keysym.h>
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,					KEY,		view,				{.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,			KEY,		tag,				{.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,		KEY,		toggleviewmaster,	{.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/* commands */
static char dmenumon[2]	= "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]		= { "dmenu_run", "-i", "-sb", selbordercolor, NULL };
static const char *termcmd[]		= { "st", NULL };

static const char *filemanagercmd[]	= { "st", "-e", "yazi", NULL };
static const char *browser[]		= { "thorium-browser", NULL };
static const char *telegram[]		= { "telegram-desktop", NULL };
static const char *flameshot[]		= { "flameshot", "gui", NULL };
static const char *obsidian[]		= { "obsidian", NULL };
static const char *music_player[]	= { "st", "-e", "kew", NULL };
static const char *vscode[]			= { "codium", NULL };
static const char *intellij_idea[]	= { "intellij-idea-ultimate-edition", NULL };
static const char *neovim[]			= { "st", "-e", "nvim", NULL };

ResourcePref resources[] = {
		{ "font",				STRING,		&font },
		{ "background",			STRING,		&normbgcolor },
		{ "bordercolor",		STRING,		&normbordercolor },
		{ "foreground",			STRING,		&normfgcolor },
		{ "selbackground",		STRING,		&selbgcolor },
		{ "selbordercolor",		STRING,		&selbordercolor },
		{ "selforeground",		STRING,		&selfgcolor },
};

static const Key keys[] = {
	/*	modifier				key				function		argument	*/
	{ MODKEY,					XK_grave,		quit,			{0} },
	{ MODKEY,					XK_0,			setlayout,		{0} },
	{ Mod1Mask,					XK_Tab,			view,			{0} },
	{ MODKEY,					XK_Tab,			viewnext,		{0} },
	{ MODKEY|ShiftMask,			XK_Tab,			viewprev,		{0} },
	{ MODKEY|ShiftMask,			XK_0,			tagall,			{0} },

	{ MODKEY,					XK_space,		spawn,			{.v = dmenucmd } },
	{ MODKEY,					XK_Return,		spawn,			{.v = termcmd } },
	{ MODKEY,					XK_BackSpace,	spawn,			SHCMD("/usr/local/bin/powermenu.sh") },
	{ 0,						XK_Print,		spawn,			{.v = flameshot } },

	{ MODKEY,					XK_e,			spawn,			{.v = filemanagercmd } },
	{ MODKEY,					XK_b,			spawn,			{.v = browser } },
	{ MODKEY,					XK_m,			spawn,			{.v = telegram } },
	{ MODKEY,					XK_s,			spawn,			{.v = flameshot } },
	{ MODKEY,					XK_o,			spawn,			{.v = obsidian } },
	{ MODKEY,					XK_p,			spawn,			{.v = music_player } },
	{ MODKEY,					XK_c,			spawn,			{.v = vscode } },
	{ MODKEY,					XK_i,			spawn,			{.v = intellij_idea } },
	{ MODKEY,					XK_v,			spawn,			{.v = neovim } },

	{ MODKEY,					XK_j,			focusstack,		{.i = +1 } },
	{ MODKEY,					XK_k,			focusstack,		{.i = -1 } },
	{ MODKEY,					XK_h,			setmfact,		{.f = -0.05} },
	{ MODKEY,					XK_l,			setmfact,		{.f = +0.05} },
	{ MODKEY,					XK_w,			killclient,		{0} },
	{ MODKEY,					XK_f,			zoom,			{0} },

	{ MODKEY,					XK_t,			floatcentered,	{0} },
	{ MODKEY,					XK_d,			movekey,		{0} },
	{ MODKEY,					XK_r,			resizekey,		{0} },

	{ 0,			XK_ISO_Next_Group,			spawn,			SHCMD("kill -35 $(pidof dwmblocks)") },
    { 0,			XF86XK_AudioRaiseVolume,	spawn,			SHCMD("wpctl set-volume @DEFAULT_SINK@ 5%+ && kill -36 $(pidof dwmblocks)") },
	{ 0,			XF86XK_AudioLowerVolume,	spawn,			SHCMD("wpctl set-volume @DEFAULT_SINK@ 5%- && kill -36 $(pidof dwmblocks)") },
	{ 0,			XF86XK_AudioMute,			spawn,			SHCMD("wpctl set-mute @DEFAULT_SINK@ toggle && kill -36 $(pidof dwmblocks)") },
	{ 0,			XF86XK_AudioMicMute,		spawn,			SHCMD("wpctl set-mute @DEFAULT_SOURCE@ toggle && kill -36 $(pidof dwmblocks)") },
	{ 0,			XF86XK_MonBrightnessUp,		spawn,			SHCMD("light -A 5 && kill -37 $(pidof dwmblocks)") },
	{ 0,			XF86XK_MonBrightnessDown,	spawn,			SHCMD("light -U 5 && kill -37 $(pidof dwmblocks)") },

	TAGKEYS(					XK_1,			0 )
	TAGKEYS(					XK_2,			1 )
	TAGKEYS(					XK_3,			2 )
	TAGKEYS(					XK_4,			3 )
	TAGKEYS(					XK_5,			4 )
	TAGKEYS(					XK_6,			5 )
	TAGKEYS(					XK_7,			6 )
	TAGKEYS(					XK_8,			7 )
	TAGKEYS(					XK_9,			8 )
};

static const Button buttons[] = {
	/* click			event mask		button			function		argument	*/
	{ ClkTagBar,		0,				Button1,		view,			{0}			},
	{ ClkTagBar,		ShiftMask,		Button1,		tag,			{0}			},
	{ ClkTagBar,		ControlMask,	Button1,		toggleview,		{0}			},
};
