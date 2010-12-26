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

-- {{{ Wibox
-- cpu
cpuwidget = widget({ type = "textbox" })
cpuwidget.width = 30
cpuwidget.align = "center"
vicious.register(cpuwidget, vicious.widgets.cpu, "$1%")
cpuicon = widget({ type = "imagebox" })
cpuicon.image = image(beautiful.widget_cpu)
-- cputhermal
cputhermalwidget  = widget({ type = "textbox" })
cputhermalwidget.width = 30
cputhermalwidget.align = "center"
vicious.register(cputhermalwidget, vicious.widgets.thermal, " $1°C", 20, { "it87.3328", "core"} )
-- memory
memwidget = widget({ type = "textbox" })
memwidget.width = 30
memwidget.align = "center"
-- vicious.register(memwidget, vicious.widgets.mem, "$1% ($2MB/$3MB)", 13)
vicious.register(memwidget, vicious.widgets.mem, "$1%", 13)
memicon = widget({ type = "imagebox" })
memicon.image = image(beautiful.widget_mem)
-- netwidget
netwidget = widget({ type = "textbox" })
netwidget.width = 75
netwidget.align = "center"
vicious.register(netwidget, vicious.widgets.net, '<span color="#CC9393">${eth0 down_kb}</span> <span color="#7F9F7F">${eth0 up_kb}</span>', 3)
dnicon = widget({ type = "imagebox" })
dnicon.image = image(beautiful.widget_net)
upicon = widget({ type = "imagebox" })
upicon.image = image(beautiful.widget_netup)
-- textclock
mytextclock = awful.widget.textclock({ align = "center" })
-- systray
mysystray = widget({ type = "systray" })
-- separator
separator = widget({ type = "textbox" })
separator.text  = "|"

