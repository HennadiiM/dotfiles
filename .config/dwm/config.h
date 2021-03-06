//static unsigned int borderpx  = 3;        /* border pixel of windows */
//static unsigned int snap      = 32;       /* snap pixel */
////static unsigned int gappih    = 20;       /* horiz inner gap between windows */
////static unsigned int gappiv    = 10;       /* vert inner gap between windows */
////static unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
////static unsigned int gappov    = 30;       /* vert outer gap between windows and screen edge */
//static int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
//static int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
//static int showbar            = 1;        /* 0 means no bar */
//static int topbar             = 1;        /* 0 means bottom bar */
//static const char *fonts[]          = { "fontawesome:size=13", "Iosevka Curly Medium:size=12"};
//static const char dmenufont[]       = "Iosevka Curly Medium:size=13";
//static char normbgcolor[]           = "#222222";
//static char normbordercolor[]       = "#444444";
//static char normfgcolor[]           = "#bbbbbb";
//static char selfgcolor[]            = "#eeeeee";
//static char selbordercolor[]        = "#770000";
//static char selbgcolor[]            = "#005577";
//static char *colors[][3] = {
//       /*               fg           bg           border   */
//       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
//       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
//};

static const unsigned int borderpx  = 1;        /* border pixel of Mod4Maskdows */
static const unsigned int snap      = 0;//32;       /* snap pixel */
static const unsigned int gappx     = 3;        /* gaps between windows */
static const int showbar            = 1;        /* 0 means no bar */
static const int swallowfloating    = 1;        /* 1 means swallow floating windows by default */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "fontawesome:size=13", "Iosevka Curly Medium:size=12"};
static const char dmenufont[]       = "Iosevka Curly Medium:size=13";

// my colors ["#272C37" "#BF6469" "#A1BA8E" "#E9CD89" "#76A2B9" "#B18FAA" "#88C3DB" "#EDEDF1"])

// dark mode 2
//static const char col_gray1[]       = "#2E3440";
//static const char col_gray3[]       = "#EDEDF1";
//static const char col_gray4[]       = "#272C37"; //

// dark mode
//static const char col_gray1[]       = "#272C37";
//static const char col_gray3[]       = "#EDEDF1";
//static const char col_gray4[]       = "#272C37";

// light mode
static const char col_gray1[]       = "#EDEDF1";
static const char col_gray3[]       = "#272C37";
static const char col_gray4[]       = "#EDEDF1";


//static const char col_gray2[]       = "#5c82ca";
static const char col_gray2[]       = "#E9CD89";
static const char col_cyan[]        = "#B18FAA"; //"#76A2B9";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

//static const char *tags[] = { "", "", "",/*3*/ "", "", "",/*6*/ "", "", "" }; //
//static const char *tags[] = { "       ", "", "",/*3*/ "", "", "",/*6*/ "", "", "" }; //             
//static const char *tags[] = { "                 ", "", "",/*3*/ "", "", "",/*6*/ "", "", "" }; //             
//static const char *tags[] = { "", "", "",/*3*/ "", "", "",/*6*/ "", "", ""}; //  ,  
static const char *tags[] = { "", "", "",/*3*/ "", "", "",/*6*/ "", "", ""}; //  ,  
//static const char *tagsalt[] = { "", "", "",/*3*/ "", "", "",/*6*/ "", "", "" }; //

static const int text_editor_tag = 0;
static const int mindmap_tag = 0;
static const int web_tag = 1;
static const int reader_tag = 2;
static const int video_audio_tag = 3;
static const int file_browser_tag = 4;
static const int recording_tag = 5;
static const int messenger_tag = 6 ;
//static const int libreoffice_tag = 7 ;
//static const int slock_tag = 7; // idea was to lock and move to this tag to show wallpaper
static const int torrent_tag = 7;
static const int network_manager_tag = torrent_tag;
static const int draw_tag = torrent_tag;
static const int tools_tag = 7;
static const int steam_tag = 8;
static const int crypto_tag = 8;

static const Rule rules[] = {
	/* class     		            instance  	title 	    tags mask  	            isfloating  	isterminal	noswallow  	monitor xkb_layout (default) */
	//{ "St",      		            NULL,     	NULL,           1 << 0,		            0,     		1,           	0,        -1, 0},
	{ "Emacs",   		            NULL,       NULL,   	    1 << text_editor_tag,             0,    		0,		        0, 	          -1 , 0},
	{ "Com.github.phase1geo.minder",NULL,       NULL,           1 << mindmap_tag,            0,    		0,		    0, 	              -1 , 0},
	{ "Brave", 		                NULL,     	NULL,           1 << web_tag,		    0,    		0,           	0,            -1 , 0},
	{ "Zathura", 		            NULL,     	NULL,           1 << reader_tag,		    0,     		0,           	0,            -1 , 0},
	{ "mpv",   		                NULL,      	NULL,		    1 << video_audio_tag,                 0,    		0,		        0,    -1 , 0},
	//{ "St",   		                NULL,       "cmus v2.8.0",	1 << video_audio_tag,                 0,    		0,		        0,    -1 , 0},
	{ "Lollypop",   		                NULL,       NULL,	1 << video_audio_tag,                 0,    		0,		        0,    -1 , 0},
	{ "St",   		                NULL,      	"ranger",   	1 << file_browser_tag,            0,    		1,		        0, 	      -1 , 0},
	// make it stay on previous tag { "St",   		                NULL,      	NULL,   	1 << ,            0,    		0,		        0, 	      -1 , -1},
	{ "Audacity",   		                NULL,       NULL,	1 << recording_tag,                 0,    		0,		        0,    -1 , 0},
	{ "zoom",   		                NULL,       NULL,	1 << recording_tag,                 0,    		0,		        0,    -1 , 0},
	{ "discord",   		                NULL,       NULL,	1 << recording_tag,                 0,    		0,		        0,    -1 , 0},
	{ "TelegramDesktop",            NULL,     	NULL,           1 << messenger_tag,		        0,     		0,           	0,-1 , 1},
	{ "qBittorrent",                NULL,     	NULL,           1 << torrent_tag,		        0,     		0,           	0,    -1 , 0},
	{ "krita",                NULL,     	NULL,           1 << draw_tag,		        0,     		0,           	0,    -1 , 0},
	{ "Gimp",                NULL,     	NULL,           1 << draw_tag,		        0,     		0,           	0,    -1 , 0},
	{ "Binance",                NULL,     	NULL,           1 << crypto_tag,		        0,     		0,           	0,    -1 , 0},
	{ NULL,      		            NULL,     	"Event Tester", 0,     		        1,     		0,           	1,        -1 }, /* xev */
	//{ "Gimp",    		NULL,  		NULL,   	0,    		1,   		0,        	0,        -1 },
	//{ "FreeMind",    NULL,     	NULL,           1 << 7,		1,     		0,           	0,        -1 },
};

static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

/* xkb frontend */
static const Bool showxkb         = True; /* False means no xkb layout text */
static const char *xkb_layouts [] = {
    "en",
    "ru",
};
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
static const char *password_manager[] = {"passmenu", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *screenlock[] = {"slock", NULL};
static const char *screenshot_fancy[] = {"flameshot-save"};
//static const char *screenshot_save[] = {"save_shotgun_hacksaw"};
//static const char *screenshot_clipboard[] = {"shotgun_hacksaw"};
//static const char *system_monitor[] = {"shotgun_hacksaw"};

static Key keys[] = {
	/* modifier                     key       	function        argument */
    // editor
	//{ MODKEY,                       	XK_e,	  	spawn,          SHCMD("wise-launch-emacs") }, // wise-launch emacsclient -c -a 'emacs' (alterna)
	{ MODKEY,                       	XK_e,	  	spawn,          SHCMD("wise-launch emacs") }, // wise-launch emacsclient -c -a 'emacs' (alterna)
	{ MODKEY,                       	XK_e,	  	view,          {.ui = 1 << text_editor_tag}},
    // minder
	{ MODKEY|ctrl|ShiftMask,                       	XK_b,	  	spawn,          SHCMD("wise-launch com.github.phase1geo.minder") },
	{ MODKEY|ctrl|ShiftMask,                       	XK_b,	  	view,          	{.ui = 1 << mindmap_tag}},
    // browser
	{ MODKEY,                       	XK_w,	  	spawn,          SHCMD("wise-launch-brave") },
	{ MODKEY,                  	    XK_w,      	view,           {.ui = 1 << web_tag} },
    // brain-viewer
	{ MODKEY,                       	XK_u,	  	spawn,          SHCMD("firefox") },
	{ MODKEY,                  	    XK_u,      	view,           {.ui = 1 << text_editor_tag} },
    // zathura
	{ MODKEY,                       	XK_r,	  	view,          	{.ui = 1 << reader_tag}},
    // mpv
	{ MODKEY,                       	XK_m,	  	view,          	{.ui = 1 << video_audio_tag}},
    // audio player
	//{ MODKEY,                       	XK_a,	  	spawn,          SHCMD("st -e wise-launch cmus")},
	{ MODKEY,                       	XK_a,	  	spawn,          SHCMD("wise-launch lollypop")},
	{ MODKEY,                       	XK_a,	  	view,          	{.ui = 1 << video_audio_tag}},
    // file manager
	{ MODKEY,                       	XK_f,	  	spawn,          SHCMD("st -e wise-launch ranger")},
	{ MODKEY,                       	XK_f,	  	view,          {.ui = 1 << file_browser_tag}},
    // force
	{ MODKEY|ShiftMask|ctrl,                   XK_f,	  	spawn,          SHCMD("st -e ranger")},
	{ MODKEY|ShiftMask|ctrl,                   XK_f,	  	view,          {.ui = 1 << file_browser_tag}},
    // audacity
	{ MODKEY|ShiftMask,                   XK_a,	  	spawn,          SHCMD("wise-launch audacity")},
	{ MODKEY|ShiftMask,                   XK_a,	  	view,          {.ui = 1 << recording_tag}},
    // zoom
	{ MODKEY|ShiftMask,                XK_z,	  	spawn,	        SHCMD("wise-launch zoom")},
	{ MODKEY|ShiftMask,                   XK_z,	  	view,          {.ui = 1 << recording_tag}},
    // discord
	{ MODKEY|ShiftMask|ctrl,                XK_d,	  	spawn,	        SHCMD("wise-launch discord")},
	{ MODKEY|ShiftMask|ctrl,                   XK_d,	  	view,          {.ui = 1 << recording_tag}},
    // discord
	{ MODKEY|ShiftMask|ctrl,                XK_d,	  	spawn,	        SHCMD("wise-launch discord")},
	{ MODKEY|ShiftMask|ctrl,                   XK_d,	  	view,          {.ui = 1 << recording_tag}},
    // messenger
	{ MODKEY,                       	XK_t,	  	spawn,          SHCMD("wise-launch telegram-desktop") },
	{ MODKEY,                       	XK_t,	  	view,          	{.ui = 1 << messenger_tag}},
    // torrent
	{ MODKEY|ShiftMask,                 XK_q,	  	spawn,          SHCMD("wise-launch qbittorrent") },
	{ MODKEY|ShiftMask,                 XK_q,	  	view,          	{.ui = 1 << torrent_tag}},
    // network manager
	{ MODKEY,                       	XK_n,	  	spawn,          SHCMD("st -e wise-launch nmtui") },
	{ MODKEY,                       	XK_n,	  	view,          	{.ui = 1 << network_manager_tag}},
   // draw program
	{ MODKEY,                 XK_x,	  	spawn,          SHCMD("wise-launch krita") },
	{ MODKEY,                 XK_x,	  	view,          	{.ui = 1 << draw_tag}},
   // mind-draw program
	{ MODKEY,                 XK_g,	  	spawn,          SHCMD("wise-launch gimp") },
	{ MODKEY,                 XK_g,	  	view,          	{.ui = 1 << draw_tag}},
    // screen lock
	//{ MODKEY,                       	XK_l,	  	view,          	{.ui = 1 << slock_tag}},
	//{ MODKEY,                           XK_l,     	togglebar,      {0} },
	{ MODKEY,			                XK_l,	  	spawn,	        {.v = screenlock }},
    // screenshot
	{ MODKEY,			    XK_s,	  	spawn,	        {.v = screenshot_fancy }},

//	{ MODKEY|ShiftMask,                       	XK_s,	  	spawn,          SHCMD("prime-run steam") },
//	{ MODKEY|ShiftMask,                       	XK_s,	  	view,          	{.ui = 1 << steam_tag}},

    // audio control
	{ MODKEY,                       	XK_p,	  	spawn,          SHCMD("st -e pulsemixer") },

	{ MODKEY|ShiftMask,                       	XK_p,	  	spawn,          {.v = password_manager}},

	{ MODKEY,                 XK_b,	  	spawn,          SHCMD("wise-launch binance") },
	{ MODKEY,                 XK_b,	  	view,          	{.ui = 1 << crypto_tag}},

    // audio control
	{ MODKEY|ShiftMask,                 XK_b,	  	spawn,          SHCMD("st -e bpytop") },

	{ MODKEY|ShiftMask,                       	XK_t,	  	spawn,          SHCMD("wise-launch st") },
	{ MODKEY|ShiftMask,                       	XK_t,	  	view,          	{.ui = 1 << tools_tag}},
    //ordinary settings
	{ MODKEY, 		                XK_q,     	killclient,     {0} },
	{ MODKEY,                       XK_h,     	togglebar,      {0} },
	{ MODKEY,                       XK_d,     	spawn,          {.v = dmenucmd } },
	{ MODKEY,			            XK_c, 	  	spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_j,     	focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,     	focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,     	setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,     	setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return,	zoom,           {0} },
	{ MODKEY,                       XK_Tab,   	view,           {0} },
	{ MODKEY|ShiftMask,             XK_space, 	togglefloating, {0} },

	//{ MODKEY,                       	XK_n,	  	view,          	{.ui = 1 << network_manager_tag}},
	{ MODKEY|ctrl,        XK_t,     	setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ctrl,        XK_m,     	setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ctrl,        XK_f,     	setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ctrl,        XK_n, 	    setlayout,      {0} },

	{ MODKEY,                       XK_parenleft, focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_parenright,focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_parenleft, tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_parenright,tagmon,         {.i = +1 } },
  //{ MODKEY|ShiftMask,                       XK_n,      togglealttag,   {0} },
	{ MODKEY|ShiftMask,             XK_plus,     	incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_minus,     	incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_0,     	view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,     	tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_1,     	                0)
	TAGKEYS(                        XK_2,     	                1)
	TAGKEYS(                        XK_3,     	                2)
	TAGKEYS(                        XK_4,     	                3)
	TAGKEYS(                        XK_5,     	                4)
	TAGKEYS(                        XK_6,     	                5)
	TAGKEYS(                        XK_7,     	                6)
	TAGKEYS(                        XK_8,     	                7)
	TAGKEYS(                        XK_9,     	                8)
	{ MODKEY|MODKEY2|ShiftMask,             XK_q,     	quit,           {0} },
// Media keys
	{ MODKEY|ShiftMask,                     XK_d,  spawn,          SHCMD("pamixer --allow-boost -i 5" )},
	{ MODKEY|ShiftMask,                     XK_f,   spawn,          SHCMD("pamixer --allow-boost -d 5" )},
	//{ MODKEY|ShiftMask,           XK_x,  spawn,          SHCMD("amixer -q sset Master 3%+" )},
	//{ MODKEY|ShiftMask,           XK_c,   spawn,          SHCMD("amixer -q sset Master 3%-" )},
	//{ MODKEY|ShiftMask,                     XK_d,  spawn,          SHCMD("amixer -q sset Master 10%+" )},
	//{ MODKEY|ShiftMask,                     XK_f,   spawn,          SHCMD("amixer -q sset Master 10%-" )},
	//{ MODKEY|ShiftMask,           XK_x,  spawn,          SHCMD("amixer -q sset Master 3%+" )},
	//{ MODKEY|ShiftMask,           XK_c,   spawn,          SHCMD("amixer -q sset Master 3%-" )},
	{ MODKEY|ShiftMask,                     XK_k,        spawn,          SHCMD("xbacklight -inc 10") },
	{ MODKEY|ShiftMask,                     XK_j,        spawn,          SHCMD("xbacklight -dec 10")},
	{ MODKEY|ctrl,           XK_k,        spawn,          SHCMD("xbacklight -inc 3") },
	{ MODKEY|ctrl,           XK_j,        spawn,          SHCMD("xbacklight -dec 3")},
	{ MODKEY|ShiftMask,           XK_m,   spawn,          SHCMD("pamixer -t")},
	//{ MODKEY|MODKEY2,           XK_r,  spawn,          SHCMD("amixer -q sset Master 3%+" )},
	//{ MODKEY|MODKEY2,           XK_e,   spawn,          SHCMD("amixer -q sset Master 3%-" )},
	//{ MODKEY|MODKEY2,            XK_u,        spawn,          SHCMD("xbacklight -inc 3") },
	//{ MODKEY|MODKEY2,             XK_i,        spawn,          SHCMD("xbacklight -dec 3")},
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
