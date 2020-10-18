/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;	/* border pixel of windows */
static const unsigned int snap      = 12;	/* snap pixel */
static const int swallowfloating    = 0;    /* swallow floating windows by default */
static const int showbar            = 1;	/* 0 means no bar */
static const int topbar             = 1;	/* 0 means bottom bar */
static const unsigned int gappx     = 46;	/* pixel gap between clients */
static const char *fonts[]          = { "DejaVu Sans Condensed:pixelsize=10", "Wuncon Siji:pixelsize=10:style=Regular" }; 
static const char dmenufont[]       = { "DejaVu Sans Condensed:pixelsize=10" };

static char normbgcolor[]           = "#E7E7D4";
static char normbordercolor[]       = "#D4D4C1";
static char normfgcolor[]           = "#657B83";
static char selfgcolor[]            = "#D4D4C1";
static char selbordercolor[]        = "#D4D4C1";
static char selbgcolor[]            = "#657B83";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging */
static const char *tags[] = { "DEV", "WWW", "SYS", "DOC", "CHAT", "MEDIA", "GFX" };

static const Rule rules[] = {
    /* class       instance         title           tags mask       isfloating  isterminal  noswallow   monitor */
    { "URxvt",     NULL,            NULL,           0,              0,          1,          0,          -1      },
    { "URxvt",     "irssi",         "irssi",        1 << 4,         0,          0,          1,          -1      },
    { "Surf",      "surf",          NULL,           1 << 1,         0,          0,          0,          -1      },
    { "tabbed",    "tabbed",        NULL,           1 << 1,         0,          0,          0,          -1      },
    { "URxvt",     "scratchpad",    "scratchpad",   1 << 5,         1,          1,          1,          -1      },
    { "Zathura",   NULL,            NULL,           1 << 3,         0,          0,          0,          -1      },
    { NULL,        NULL,            "Event Tester", 0,              0,          0,          1,          -1      },
};

/* layout(s) */
static const float mfact     = 0.5;  /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "", 	tile 	},    /* first entry is default */
    { "", 	NULL 	},    /* no layout function means floating behavior */
    { "", 	monocle	},
    { "", 	grid	},
    { "", 	bstack	},
    { "", 	bhstack	},
    { "", 	dwindle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *audioplay[]      = { "audioctrl", "play", NULL };
static const char *audionext[]      = { "audioctrl", "next", NULL };
static const char *audioprev[]      = { "audioctrl", "prev", NULL };
static const char *audiostop[]      = { "audioctrl", "stop", NULL };
static const char *chatcmd[]        = { "urxvtc", "-name", "irssi", "-e", "irssi", "--home=~/.config/irssi", "--config=~/.config/irssi/config", NULL };
static const char *dmenucmd[]       = { "dmenu_run", "-p", " Find: ", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", normfgcolor, "-sf", normbgcolor, NULL };
static const char *printcmd[]       = { "scrot", NULL };
static const char *rebootcmd[]      = { "systemctl", "reboot", NULL };
static const char *scratchpadcmd[]  = { "urxvtc", "-name", "scratchpad", "-geometry", "120x34", NULL };
static const char *shutcmd[]        = { "systemctl", "poweroff", NULL };
static const char *surfcmd[]        = { "tabbed", "-r", "2", "surf", "-pe", "x", "https://dwm.suckless.org", NULL };
static const char *sysmenu[]        = { "sysmenu", NULL };
static const char *termcmd[]        = { "urxvtc", NULL };
static const char *volupcmd[]       = { "changevol", "up", NULL };
static const char *voldowncmd[]     = { "changevol", "down", NULL };
static const char *voltogglecmd[]   = { "changevol", "mute", NULL };
static const char *xmenucmd[]       = { "menux", NULL };

static Key keys[] = {
    /* modifier                     key                        function	                argument */
    { MODKEY,                       XK_p,                      spawn,                   {.v = dmenucmd } },
    { MODKEY,                       XK_Return,                 spawn,                   {.v = termcmd } },
    { MODKEY,                       XK_w,                      spawn,                   {.v = surfcmd } },
    { MODKEY,                       XK_i,                      spawn,                   {.v = chatcmd } },
    { MODKEY,                       XK_dead_circumflex,        togglescratch,           {.v = scratchpadcmd } },
    { ControlMask|MODKEY,           XK_r,                      spawn,                   {.v = rebootcmd } },
    { ControlMask|MODKEY,           XK_q,                      spawn,                   {.v = shutcmd } },
    { MODKEY,                       XK_b,                      togglebar,               {0} },
    { MODKEY,                       XK_q,                      killclient,              {0} },
    { MODKEY,                       XK_Right,                  shiftview,               {.i = +1 } },
    { MODKEY,                       XK_Left,                   shiftview,               {.i = -1 } },
    { MODKEY|ShiftMask,             XK_j,                      rotatestack,             {.i = +1 } },
    { MODKEY|ShiftMask,             XK_k,                      rotatestack,             {.i = -1 } },
    { MODKEY,                       XK_j,                      focusstack,              {.i = +1 } },
    { MODKEY,                       XK_k,                      focusstack,              {.i = -1 } },
    { MODKEY,                       XK_h,                      setmfact,                {.f = -0.05} },
    { MODKEY,                       XK_l,                      setmfact,                {.f = +0.05} },
    { MODKEY|ShiftMask,             XK_Return,                 zoom,                    {0} },
    { MODKEY,                       XK_Tab,                    view,                    {0} },
    { MODKEY,                       XK_t,                      setlayout,               {.v = &layouts[0]} },
    { MODKEY,                       XK_f,                      setlayout,               {.v = &layouts[1]} },
    { MODKEY,                       XK_m,                      setlayout,               {.v = &layouts[2]} },
    { MODKEY,                       XK_g,                      setlayout,               {.v = &layouts[3]} },
    { MODKEY,                       XK_u,                      setlayout,               {.v = &layouts[4]} },
    { MODKEY,                       XK_o,                      setlayout,               {.v = &layouts[5]} },
    { MODKEY,                       XK_r,                      setlayout,               {.v = &layouts[6]} },
    { MODKEY,                       XK_space,                  setlayout,               {0} },
    { MODKEY|ShiftMask,             XK_space,                  togglefloating,          {0} },
    { MODKEY,                       XK_0,                      view,                    {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,                      tag,                     {.ui = ~0 } },
    { MODKEY,                       XK_comma,                  focusmon,                {.i = -1 } },
    { MODKEY,                       XK_period,                 focusmon,                {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,                  tagmon,                  {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period,                 tagmon,                  {.i = +1 } },
    { MODKEY,                       XK_plus,                   setgaps,                 {.i = -1 } },
    { MODKEY,                       XK_minus,                  setgaps,                 {.i = +1 } },
    { MODKEY|ShiftMask,             XK_minus,                  setgaps,                 {.i = 0  } },
    { MODKEY,                       XK_F5,                     xrdb,                    {.v = NULL } },
    { MODKEY|ShiftMask,             XK_q,                      quit,                    { 0 } },
    TAGKEYS(                        XK_1,                                               0)
    TAGKEYS(                        XK_2,                                               1)
    TAGKEYS(                        XK_3,                                               2)
    TAGKEYS(                        XK_4,                                               3)
    TAGKEYS(                        XK_5,                                               4)
    TAGKEYS(                        XK_6,                                               5)
    TAGKEYS(                        XK_7,                                               6)
    TAGKEYS(                        XK_8,                                               7)
    TAGKEYS(                        XK_9,                                               8)
    { 0,                            XF86XK_Launch1,             spawn,                  {.v = sysmenu } },
    { 0,                            XF86XK_AudioPlay,           spawn,                  {.v = audioplay } },
    { 0,                            XF86XK_AudioNext,           spawn,                  {.v = audionext } },
    { 0,                            XF86XK_AudioPrev,           spawn,                  {.v = audioprev } },
    { 0,                            XF86XK_AudioStop,           spawn,                  {.v = audiostop } },
    { 0,                            XF86XK_AudioLowerVolume,    spawn,                  {.v = voldowncmd } },
    { 0,                            XF86XK_AudioRaiseVolume,    spawn,                  {.v = volupcmd } },
    { 0,                            XF86XK_AudioMute,           spawn,                  {.v = voltogglecmd } },
    { 0,                            XK_Print,                   spawn,                  {.v = printcmd } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function            argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,          {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,          {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,               {0} },
    { ClkStatusText,        0,              Button2,        spawn,              {.v = termcmd } },
    { ClkRootWin,           0,              Button3,        spawn,              {.v = xmenucmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,          {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating,     {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,        {0} },
    { ClkTagBar,            0,              Button1,        view,               {0} },
    { ClkTagBar,            0,              Button3,        toggleview,         {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,                {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,          {0} },
};
