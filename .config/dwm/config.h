#include <X11/XF86keysym.h>

static const unsigned int borderpx  = 0;        /* border pixel of Mod4Maskdows */
static const unsigned int snap      = 0;//32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int swallowfloating    = 1;        /* 1 means swallow floating windows by default */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "fontawesome:size=13", "Iosevka Medium:size=12"};
static const char dmenufont[]       = "Iosevka Medium:size=13";
// nord colors ["#2E3440" "#BF616A" "#A3BE8C" "#EBCB8B" "" "#B48EAD" "#88C0D0" "#ECEFF4"])
static const char col_gray1[]       = "#2e3440";
static const char col_gray2[]       = "#5c82ca";
static const char col_gray3[]       = "#eceff4";
static const char col_gray4[]       = "#2e3440";
static const char col_cyan[]        = "#81A1C1";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

static const char *tags[] = { "", "", "",/*3*/ "", "", "", "",/*6*/ "", "" };

static const int Emacs_tag = 0;
static const int brave_tag = 1;
static const int Zathura_tag = 2;
static const int mpv_tag = 3;
static const int ranger_tag = 4;
static const int minder_tag = 5;
static const int TelegramDesktop_tag = 6 ;
//static const int libreoffice_tag = 7 ;
static const int slock_tag = 7;
static const int qBittorrent_tag = 8;

static const Rule rules[] = {
	/* class     		            instance  	title 	    tags mask  	            isfloating  	isterminal	noswallow  	monitor */
	//{ "St",      		            NULL,     	NULL,           1 << 0,		            0,     		1,           	0,        -1 },
	{ "St",   		                NULL,      	"ranger",   	1 << ranger_tag,            0,    		0,		        0, 	-1 },
	{ "Emacs",   		            NULL,       NULL,   	    1 << Emacs_tag,             0,    		0,		        0, 	-1 },
	{ "Brave", 		                NULL,     	NULL,           1 << brave_tag,		    0,    		0,           	0,        -1 },
	{ "Com.github.phase1geo.minder",NULL,       NULL,           1 << minder_tag,            0,    		0,		    0, 	-1 },
	{ "Zathura", 		            NULL,     	NULL,           1 << Zathura_tag,		    0,     		0,           	0,        -1 },
	{ "mpv",   		                NULL,      	NULL,		    1 << mpv_tag,                 0,    		0,		        0, 	       -1 },
	{ "TelegramDesktop",            NULL,     	NULL,           1 << TelegramDesktop_tag,		        0,     		0,           	0,        -1 },
	{ "qBittorrent",                NULL,     	NULL,           1 << qBittorrent_tag,		        0,     		0,           	0,        -1 },
	{ NULL,      		            NULL,     	"Event Tester", 0,     		        1,     		0,           	1,        -1 }, /* xev */
	//{ "Gimp",    		NULL,  		NULL,   	0,    		1,   		0,        	0,        -1 },
	//{ "FreeMind",    NULL,     	NULL,           1 << 7,		1,     		0,           	0,        -1 },
};

static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[M]",      monocle }, /* first entry is default */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
};

#define MODKEY Mod4Mask
#define ctrl ControlMask
#define MODKEY2 Mod1Mask

#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                  KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|MODKEY2,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|MODKEY2|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *screenlock[] = {"slock", NULL};
static const char *screenshot_save[] = {"save_shotgun_hacksaw"};
static const char *screenshot_clipboard[] = {"shotgun_hacksaw"};

static Key keys[] = {
	/* modifier                     key       	function        argument */
    // file manager
	{ MODKEY,                       	XK_f,	  	spawn,          SHCMD("st -e wise-launch ranger")},
	{ MODKEY,                       	XK_f,	  	view,          {.ui = 1 << ranger_tag}},
    // force
	{ MODKEY|MODKEY2,                   XK_f,	  	spawn,          SHCMD("st -e ranger")},
	{ MODKEY|MODKEY2,                   XK_f,	  	view,          {.ui = 1 << ranger_tag}},
    // editor
	{ MODKEY,                       	XK_e,	  	spawn,          SHCMD("wise-launch emacs") },
	{ MODKEY,                       	XK_e,	  	view,          {.ui = 1 << Emacs_tag}},
    // browser
	{ MODKEY,                       	XK_w,	  	spawn,          SHCMD("wise-launch brave") },
	{ MODKEY,                  	    XK_w,      	view,           {.ui = 1 << brave_tag} },
    // brain-viewer
	{ MODKEY,                       	XK_u,	  	spawn,          SHCMD("firefox") },
	{ MODKEY,                  	    XK_u,      	view,           {.ui = 1 << Emacs_tag} },
    // minder
	{ MODKEY,                       	XK_b,	  	spawn,          SHCMD("wise-launch com.github.phase1geo.minder") },
	{ MODKEY,                       	XK_b,	  	view,          	{.ui = 1 << minder_tag}},
    // mpv
	{ MODKEY,                       	XK_m,	  	view,          	{.ui = 1 << mpv_tag}},
    // zathura
	{ MODKEY,                       	XK_r,	  	view,          	{.ui = 1 << Zathura_tag}},
    // messenger
	{ MODKEY,                       	XK_t,	  	spawn,          SHCMD("wise-launch telegram-desktop") },
	{ MODKEY,                       	XK_t,	  	view,          	{.ui = 1 << TelegramDesktop_tag}},
    // torrent
	{ MODKEY|ShiftMask,                 XK_q,	  	spawn,          SHCMD("wise-launch qbittorrent") },
	{ MODKEY|ShiftMask,                 XK_q,	  	view,          	{.ui = 1 << qBittorrent_tag}},
    //force
	{ MODKEY|MODKEY2|ShiftMask,         XK_q,	  	spawn,          SHCMD("qbittorrent") },
	{ MODKEY|MODKEY2|ShiftMask,         XK_q,	  	view,          	{.ui = 1 << qBittorrent_tag}},
    // network manager
	{ MODKEY,                       	XK_n,	  	spawn,          SHCMD("st -e wise-launch nmtui") },
	{ MODKEY,                       	XK_n,	  	view,          	{.ui = 1 << 8}},
    // screen lock
	//{ MODKEY,                       	XK_l,	  	view,          	{.ui = 1 << slock_tag}},
	//{ MODKEY,                           XK_l,     	togglebar,      {0} },
	{ MODKEY,			                XK_l,	  	spawn,	        {.v = screenlock }},
    // screenshot
	{ MODKEY|ShiftMask,			    XK_s,	  	spawn,	        {.v = screenshot_clipboard }},
	{ MODKEY,			                XK_s,	  	spawn,	        {.v = screenshot_save }},

    //ordinary settings
	{ MODKEY,                       XK_h,     	togglebar,      {0} },
	{ MODKEY,                       XK_a,     	spawn,          {.v = dmenucmd } },
	{ MODKEY,			            XK_c, 	  	spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_j,     	focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,     	focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,     	setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,     	setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return,	zoom,           {0} },
	{ MODKEY,                       XK_Tab,   	view,           {0} },
	{ MODKEY, 		                XK_q,     	killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_t,     	setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_m,     	setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_f,     	setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space, 	setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space, 	togglefloating, {0} },
	{ MODKEY,                       XK_0,     	view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,     	tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_parenleft, focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_parenright,focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_parenleft, tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_parenright,tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_plus,     	incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_minus,     	incnmaster,     {.i = -1 } },
	TAGKEYS(                        XK_1,     	                0)
	TAGKEYS(                        XK_2,     	                1)
	TAGKEYS(                        XK_3,     	                2)
	TAGKEYS(                        XK_4,     	                3)
	TAGKEYS(                        XK_5,     	                4)
	TAGKEYS(                        XK_6,     	                5)
	TAGKEYS(                        XK_7,     	                6)
	TAGKEYS(                        XK_8,     	                7)
	TAGKEYS(                        XK_9,     	                8)
	{ MODKEY|ShiftMask,             XK_r,     	quit,           {0} },
// Media keys
	{ MODKEY,                     XK_period,  spawn,          SHCMD("amixer -q sset Master 10%+" )},
	{ MODKEY|ShiftMask,           XK_period,  spawn,          SHCMD("amixer -q sset Master 3%+" )},
	{ MODKEY,                     XK_comma,   spawn,          SHCMD("amixer -q sset Master 10%-" )},
	{ MODKEY|ShiftMask,           XK_comma,   spawn,          SHCMD("amixer -q sset Master 3%-" )},
	{ MODKEY|ShiftMask,           XK_space,   spawn,          SHCMD("amixer -q sset Master toggle")},
	{ MODKEY,                      XK_i,        spawn,          SHCMD("xbacklight -inc 10") },
	{ MODKEY|ShiftMask,            XK_i,        spawn,          SHCMD("xbacklight -inc 3") },
	{ MODKEY,                      XK_d,        spawn,          SHCMD("xbacklight -dec 10")},
	{ MODKEY|ShiftMask,             XK_d,        spawn,          SHCMD("xbacklight -dec 3")},
};

static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
