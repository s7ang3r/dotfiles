local modes = {}

function new_mode(name, mode)
    assert(string.match(name, "^[%w-_]+$"), "invalid mode name: " .. name)
    modes[name] = lousy.util.table.join(modes[name] or {}, mode, { name = name })
end

