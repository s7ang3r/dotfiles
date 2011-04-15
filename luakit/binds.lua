local key, buf, but = lousy.bind.key, lousy.bind.buf, lousy.bind.but
local cmd, any = lousy.bind.cmd, lousy.bind.any
local match, join = string.match, lousy.util.table.join
local strip, split = lousy.util.string.strip, lousy.util.string.split
local scroll_step = globals.scroll_step or 20
local more, less = "+"..scroll_step.."px", "-"..scroll_step.."px"
local zoom_step = globals.zoom_step or 0.1
local homepage = globals.homepage or "http://luakit.org"


