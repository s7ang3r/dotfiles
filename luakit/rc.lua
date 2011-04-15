require "lousy"

function warn(...) io.stderr:write(string.format(...) .. "\n") end
function info(...) if luakit.verbose then io.stderr:write(string.format(...) .. "\n") end end

require "globals"

lousy.theme.init(lousy.util.find_config("theme.lua"))
theme = assert(lousy.theme.get(), "failed to load theme")

require "window"
require "webview"
require "modes"
require "binds"
require "cookies"
require "formfiller"
require "proxy"
require "quickmarks"
require "session"
require "undoclose"
require "tabhistory"
require "userscripts"
require "bookmarks"

