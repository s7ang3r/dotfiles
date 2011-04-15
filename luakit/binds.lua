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

