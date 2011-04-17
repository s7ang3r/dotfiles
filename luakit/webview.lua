webview = {}

webview.init_funcs = {
    set_useragent = function (view, w)
        view:set_property('user-agent', globals.useragent)
    end,

    checking_ssl = function (view, w)
        local ca_file = soup.get_property("ssl-ca-file")
        if ca_file and os.exists(ca_file) then
            w.checking_ssl = true
        end
    end,

    title_update = function (view, w)
        view:add_signal("property::title", function (v)
            w:update_tablist()
            if w:is_current(v) then
                w:update_win_title()
            end
        end)
    end,

    uri_update = function (view, w)
        view:add_signal("property::uri", function (v)
            w:update_tablist()
            if w:is_current(v) then
                w:update_uri(v)
            end
        end)
    end,

    tablist_update = function (view, w)
        view:add_signal("load-status", function (v, status)
            if status == "provisional" or status == "finished" or status == "failed" then
                w:update_tablist()
            end
        end)
    end,

    scroll_update = function (view, w)
        view:add_signal("expose", function (v)
            if w:is_current(v) then
                w:update_scroll(v)
            end
        end)
    end,

    progress_update = function (view, w)
        for _, sig in ipairs({"load-status", "property::progress"}) do
            view:add_signal(sig, function (v)
                if w:is_current(v) then
                    w:update_progress(v)
                    w:update_ssl(v)
                end
            end)
        end
    end,

    link_hover_display = function (view, w)
        view:add_signal("link-hover", function (v, link)
            if w:is_current(v) and link then
                w:update_uri(v, nil, link)
            end
        end)
        view:add_signal("link-unhover", function (v)
            if w:is_current(v) then
                w:update_uri(v)
            end
        end)
    end,

    form_insert_mode = function (view, w)
        view:add_signal("button-press", function (v, mods, button, context)
            (w.search_state or {}).marker = nil

            if button == 1 then
                if context.editable then
                    view:emit_signal("form-active")
                else
                    view:emit_signal("root-active")
                end
            end
        end)

        view:add_signal("form-active", function ()
            if w:get_mode() ~= "passthrough" then
                w:set_mode("insert")
            end
        end)
        view:add_signal("root-active", function ()
            if w:get_mode() ~= "passthrough" then
                w:set_mode()
            end
        end)
    end,

    mode_key_filter = function (view, w)
        view:add_signal("key-press", function ()
            local mode = w:get_mode()
            if mode ~= "insert" and mode ~= "passthrough" then return true end
        end)
    end,

    button_bind_match = function (view, w)
        view:add_signal("button-release", function (v, mods, button, context)
            (w.search_state or {}).marker = nil
            if w:hit(mods, button, { context = context }) then
                return true
            end
        end)
    end,

    mode_reset_on_nav = function (view, w)
        view:add_signal("load-status", function (v, status)
            if w:is_current(v) and status == "provisional" then
                if w:is_mode("insert") or w:is_mode("command") then w:set_mode() end
            end
        end)
    end,

    domain_properties = function (view, w)
        view:add_signal("load-status", function (v, status)
            if status ~= "committed" then return end
            local domain = (v.uri and string.match(v.uri, "^%a+://([^/]*)/?")) or "about:blank"
            if string.match(domain, "^www.") then domain = string.sub(domain, 5) end
            local props = lousy.util.table.join(domain_props.all or {}, domain_props[domain] or {})
            for k, v in pairs(props) do
                info("Domain prop: %s = %s (%s)", k, tostring(v), domain)
                view:set_property(k, v)
            end
        end)
    end,

    mime_decision = function (view, w)
        view:add_signal("mime-type-decision", function (v, link, mime)
            info("Requested link: %s (%s)", link, mime)
        end)
    end,

    window_decision = function (view, w)
        view:add_signal("new-window-decision", function (v, link, reason)
            info("New window decision: %s (%s)", link, reason)
            if reason == "link-clicked" then
                window.new({ link })
                return true
            end
            w:new_tab(link)
        end)
    end,

    create_webview = function (view, w)
        view:add_signal("create-web-view", function (v)
            return w:new_tab()
        end)
    end,

    populate_popup = function (view, w)
        view:add_signal("populate-popup", function (v)
            return {
                true,
                { "_Toggle Source", function () w:toggle_source() end },
                { "_Zoom", {
                    { "Zoom _In",    function () w:zoom_in()  end },
                    { "Zoom _Out",   function () w:zoom_out() end },
                    true,
                    { "Zoom _Reset", function () w:zoom_set() end }, }, },
            }
        end)
    end,

    resource_request_decision = function (view, w)
        view:add_signal("resource-request-starting", function(v, uri)
            info("Requesting: %s", uri)
        end)
    end,
}

