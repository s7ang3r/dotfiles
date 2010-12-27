-- {{{ Main
theme = {}
theme.confdir       = awful.util.getdir("config")
theme.wallpaper_cmd = { "awsetbg /home/s7ang3r/.config/awesome/wallpaper-40962.jpg" }
-- }}}

-- {{{ Styles
theme.font          = "terminus 8"
-- }}}

-- {{{ Colors
theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"
theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel   = theme.confdir .. "/taglist/squarefw.png"
theme.taglist_squares_unsel = theme.confdir .. "/taglist/squarew.png"
-- }}}

-- {{{ Menu
theme.menu_submenu_icon = theme.confdir .. "/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_normal = theme.confdir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.confdir .. "/titlebar/close_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.confdir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme.confdir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.confdir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = theme.confdir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.confdir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme.confdir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.confdir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme.confdir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.confdir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme.confdir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.confdir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme.confdir .. "/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.confdir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme.confdir .. "/titlebar/maximized_focus_active.png"
-- }}}

-- {{{ Layout
theme.layout_fairh = theme.confdir .. "/layouts/fairhw.png"
theme.layout_fairv = theme.confdir .. "/layouts/fairvw.png"
theme.layout_floating  = theme.confdir .. "/layouts/floatingw.png"
theme.layout_magnifier = theme.confdir .. "/layouts/magnifierw.png"
theme.layout_max = theme.confdir .. "/layouts/maxw.png"
theme.layout_fullscreen = theme.confdir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = theme.confdir .. "/layouts/tilebottomw.png"
theme.layout_tileleft   = theme.confdir .. "/layouts/tileleftw.png"
theme.layout_tile = theme.confdir .. "/layouts/tilew.png"
theme.layout_tiletop = theme.confdir .. "/layouts/tiletopw.png"
theme.layout_spiral  = theme.confdir .. "/layouts/spiralw.png"
theme.layout_dwindle = theme.confdir .. "/layouts/dwindlew.png"
-- }}}

-- {{{ Widgets
theme.widget_net = theme.confdir .. "/home/s7ang3r/.config/awesome/icons/down.png"
theme.widget_netup = theme.confdir .. "/home/s7ang3r/.config/awesome/icons/up.png"
theme.widget_cpu = theme.confdir .. "/home/s7ang3r/.config/awesome/icons/cpu.png"
theme.widget_mem = theme.confdir .. "/home/s7ang3r/.config/awesome/icons/mem.png"
-- }}}

theme.tasklist_floating_icon = "/home/s7ang3r/.config/awesome/tasklist/floatingw.png"
theme.awesome_icon = "/home/s7ang3r/.config/awesome/awesome16.png"

return theme
