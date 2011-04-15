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
require "downloads"
require "downloads_chrome"
require "follow"
require "completion"
require "cmdhist"
require "search"
require "taborder"
require "history"
require "follow_selected"
require "go_input"
require "go_next_prev"
require "go_up"

