require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("debian.menu")
require("vicious")

terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
home   = os.getenv("HOME")
exec   = awful.util.spawn
sexec  = awful.util.spawn_with_shell

beautiful.init(home .. "/.config/awesome/theme.lua")

modkey = "Mod4"

layouts =
{
    awful.layout.suit.floating, --1
    awful.layout.suit.tile,     --2
    awful.layout.suit.tile.top, --3
    awful.layout.suit.fair,     --4
    awful.layout.suit.max,      --5
    awful.layout.suit.magnifier --6
}

tags =
{
    names  =
        {
            "main", "www", "im", "coding"
        },
    layout =
        {
            layouts[1], layouts[5], layouts[5], layouts[5]
        }
}

for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)
end

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

