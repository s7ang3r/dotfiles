local key, buf, but = lousy.bind.key, lousy.bind.buf, lousy.bind.but
local cmd, any = lousy.bind.cmd, lousy.bind.any
local match, join = string.match, lousy.util.table.join
local strip, split = lousy.util.string.strip, lousy.util.string.split
local scroll_step = globals.scroll_step or 20
local more, less = "+"..scroll_step.."px", "-"..scroll_step.."px"
local zoom_step = globals.zoom_step or 0.1
local homepage = globals.homepage or "http://luakit.org"

function add_binds(mode, binds, before)
    assert(binds and type(binds) == "table", "invalid binds table type: " .. type(binds))
    mode = type(mode) ~= "table" and {mode} or mode
    for _, m in ipairs(mode) do
        local mdata = get_mode(m)
        if mdata and before then
            mdata.binds = join(binds, mdata.binds or {})
        elseif mdata then
            mdata.binds = mdata.binds or {}
            for _, b in ipairs(binds) do table.insert(mdata.binds, b) end
        else
            new_mode(m, { binds = binds })
        end
    end
end

function add_cmds(cmds, before)
    assert(cmds and type(cmds) == "table", "invalid cmds table type: " .. type(cmds))
    local mdata = get_mode("command")
    if mdata and before then
        mdata.commands = join(cmds, mdata.commands or {})
    elseif mdata then
        mdata.commands = join(mdata.commands or {}, cmds)
    else
        new_mode("command", { commands = cmds })
    end
end

menu_binds = {
    key({},          "j",       function (w) w.menu:move_down() end),
    key({},          "k",       function (w) w.menu:move_up()   end),
    key({},          "Down",    function (w) w.menu:move_down() end),
    key({},          "Up",      function (w) w.menu:move_up()   end),
    key({},          "Tab",     function (w) w.menu:move_down() end),
    key({"Shift"},   "Tab",     function (w) w.menu:move_up()   end),
}

add_binds("all", {
    key({},          "Escape",  function (w) w:set_mode() end),
    key({"Control"}, "[",       function (w) w:set_mode() end),
    but({},     8,  function (w) w:back()     end),
    but({},     9,  function (w) w:forward()  end),
    but({},     2,  function (w, m)
        if not m.context.editable then
            local uri = w:get_current().hovered_uri
            if uri then
                w:new_tab(uri, false)
            else
                uri = luakit.get_selection()
                if uri then w:navigate(w:search_open(uri)) end
            end
        end
    end),
    but({"Control"}, 1, function (w, m)
        local uri = w:get_current().hovered_uri
        if uri then
            w:new_tab(uri, false)
        end
    end),
})

