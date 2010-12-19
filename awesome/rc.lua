require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("debian.menu")
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

terminal = "urxvt"
editor = "vim"

modkey = "Mod4"

layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}

tags = 
{
    names  = { "main", "www", "im", "coding", "gimp", "office", 7, 8, 9 },
    layout =
    {
        layouts[1], layouts[2], layouts[1], layouts[5], layouts[6],
        layouts[12], layouts[9], layouts[3], layouts[7]
    }
}

for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)

floatapps =
{
    ["MPlayer"] = true,
    ["gimp"] = true,
    ["mocp"] = true
}

titlebarapps = 
{
    ["gimp"] = true
}

mysystray = widget({ type = "systray" })
mytextclock = awful.widget.textclock({ align = "right" })

