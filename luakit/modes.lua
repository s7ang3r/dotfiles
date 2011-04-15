local modes = {}

function new_mode(name, mode)
    assert(string.match(name, "^[%w-_]+$"), "invalid mode name: " .. name)
    modes[name] = lousy.util.table.join(modes[name] or {}, mode, { name = name })
end

function get_mode(name)
    assert(string.match(name, "^[%w-_]+$"), "invalid mode name: " .. name)
    return modes[name]
end

window.init_funcs.modes_setup = function (w)
    w:add_signal("mode-changed", function (_, name)
        local leave = (w.mode or {}).leave
        local mode = modes[name]
        w.mode = mode
        if leave then leave(w) end
        if not mode then
            error("changed to un-handled mode: " .. name)
        end
        w:update_binds(name)
        if mode.enter then mode.enter(w) end
        w:emit_signal("mode-entered", mode)
    end)
    w.ibar.input:add_signal("changed", function ()
        local mode = w.mode
        if mode and mode.changed then
            mode.changed(w, w.ibar.input.text)
        end
    end)
    w.ibar.input:add_signal("activate", function ()
        local mode = w.mode
        if mode and mode.activate then
            local text, hist = w.ibar.input.text, mode.history
            if mode.activate(w, text) == false then return end
            if hist and hist.items and hist.items[hist.len or -1] ~= text then
                table.insert(hist.items, text)
            end
        end
    end)

end

local mset, mget = lousy.mode.set, lousy.mode.get
for name, func in pairs({
    set_mode = function (w, name)        mset(w, name)   end,
    get_mode = function (w)       return mget(w)         end,
    is_mode  = function (w, name) return name == mget(w) end,
}) do window.methods[name] = func end


