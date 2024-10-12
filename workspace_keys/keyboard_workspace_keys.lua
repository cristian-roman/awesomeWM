-- awesome libraries
local gears = require("gears")
local awful = require("awful")

--global vars
local vars = require("variables")
local modkey = vars.modkey
local terminal = vars.terminal
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
    require("workspace_keys.commands.show_help"),
    require("workspace_keys.commands.clients"),
    require("workspace_keys.commands.screens"),
    require("workspace_keys.commands.tags"),
    require("workspace_keys.commands.awesome"),
    require("workspace_keys.commands.apps_launcher"),
    -- awful.key({modkey, "Shift"   }, "w", function () menu:show() end, {description = "show main menu", group = "awesome"}),
    -- awful.key({ modkey,       }, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
    
        -- Standard program
    awful.key({ modkey,           }, "=", function () awful.tag.incmwfact( 0.05) end, {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "-", function () awful.tag.incmwfact(-0.05) end, {description = "decrease master width factor", group = "layout"}),
    -- awful.key({ modkey,           }, "l", function () awful.tag.incncol( 1, nil, true) end, {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "j", function () awful.tag.incncol(-1, nil, true) end, {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "]", function () awful.tag.incnmaster( 1, nil, true) end, {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "[", function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(1) end, {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),
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

    globalkeys = require("workspace_keys.commands.tags.bind_tags_to_nums").bind_tags_to_nums(globalkeys)

    root.keys(globalkeys)