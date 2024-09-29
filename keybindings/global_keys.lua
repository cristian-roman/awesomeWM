-- awesome libraries
local gears = require("gears")
local awful = require("awful")

-- dependencies
local hotkeys_popup = require("awful.hotkeys_popup")

--global vars
local vars = require("variables")
local modkey = vars:get("modkey")
local terminal = vars:get("terminal")
local menubar = require("menubar")

local keybindings = {}

local shift_pressed = false
local double_shift_timer = gears.timer {
    timeout = 0.5, -- half-second window for detecting double press
    autostart = false,
    callback = function()
        shift_pressed = false
    end
}

local globalkeys = gears.table.join(
    awful.key({modkey, "Shift"   }, "s", hotkeys_popup.show_help, {description="show help", group="awesome"}),
    awful.key({modkey, "Shift"   }, "w", function () menu:show() end, {description = "show main menu", group = "awesome"}),
    awful.key({modkey,           }, "q",   awful.tag.viewprev, {description = "view previous", group = "tag"}),
    awful.key({modkey,           }, "e",   awful.tag.viewnext, {description = "view next", group = "tag"}),
    awful.key({modkey,           }, "Tab", awful.tag.history.restore, {description = "go back", group = "tag"}),
    awful.key({modkey,           }, "Left", function () awful.client.focus.byidx(-1) end, {description = "focus previous by index", group = "client"}),
    awful.key({modkey,           }, "Right", function () awful.client.focus.byidx(1) end, {description = "focus next by index", group = "client"}),

        -- Layout manipulation
    awful.key({ modkey, "Shift"  }, "Left", function () awful.client.swap.byidx(-1) end, {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Shift"  }, "Right", function () awful.client.swap.byidx(1) end, {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey,          }, ".", function () awful.screen.focus_relative(1) end, {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey,          }, ",", function () awful.screen.focus_relative(-1) end,{description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,          }, "\\", function () awful.client.focus.history.previous() if client.focus then client.focus:raise() end end, {description = "go back", group = "client"}),
    -- awful.key({ modkey,       }, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
    
        -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control" }, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end, {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "=", function () awful.tag.incmwfact( 0.05) end, {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "-", function () awful.tag.incmwfact(-0.05) end, {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey,           }, "l", function () awful.tag.incncol( 1, nil, true) end, {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "j", function () awful.tag.incncol(-1, nil, true) end, {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "]", function () awful.tag.incnmaster( 1, nil, true) end, {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "[", function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(1) end, {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "n",
        function ()
            local c = awful.client.restore()
                -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
            end
        end,
        {description = "restore minimized", group = "client"}),
    -- Prompt
    awful.key({ modkey            }, "r",     function () awful.screen.focused().mypromptbox:run() end,{description = "run prompt", group = "launcher"}),
    awful.key({ modkey, "Control" }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({                   }, "Shift_L", 
        function()
            if shift_pressed then
                -- Shift was pressed twice, trigger your action here
                menubar.show()
                shift_pressed = false
                double_shift_timer:stop()
            else
                shift_pressed = true
                double_shift_timer:start()
            end
        end,
        {description = "show the menubar", group = "launcher"})
    )

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- should map on the top row of your keyboard, usually 1 to 9.
    for i = 1, 9 do
        globalkeys = gears.table.join(globalkeys,
            -- View tag only.
            awful.key({ modkey }, "#" .. i + 9,
                      function ()
                            local screen = awful.screen.focused()
                            local tag = screen.tags[i]
                            if tag then
                               tag:view_only()
                            end
                      end,
                      {description = "view tag #"..i, group = "tag"}),
            -- Toggle tag display.
            awful.key({ modkey, "Control" }, "#" .. i + 9,
                      function ()
                          local screen = awful.screen.focused()
                          local tag = screen.tags[i]
                          if tag then
                             awful.tag.viewtoggle(tag)
                          end
                      end,
                      {description = "toggle tag #" .. i, group = "tag"}),
            -- Move client to tag.
            awful.key({ modkey, "Shift" }, "#" .. i + 9,
                      function ()
                          if client.focus then
                              local tag = client.focus.screen.tags[i]
                              if tag then
                                  client.focus:move_to_tag(tag)
                              end
                         end
                      end,
                      {description = "move focused client to tag #"..i, group = "tag"}),
            -- Toggle tag on focused client.
            awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                      function ()
                          if client.focus then
                              local tag = client.focus.screen.tags[i]
                              if tag then
                                  client.focus:toggle_tag(tag)
                              end
                          end
                      end,
                      {description = "toggle focused client on tag #" .. i, group = "tag"})
        )
    end

    return globalkeys