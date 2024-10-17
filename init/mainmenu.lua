local hotkeys_popup = require("awful.hotkeys_popup")
local terminal = require("variables").terminal
local editor_cmd = require("variables").editor_cmd
local beautiful = require("beautiful")
local awful = require("awful")


awful.util.mymainmenu = awful.menu({ 
        items = {  
                    { " open terminal", terminal },
                    { "󱋆 config screens", function() awful.spawn.with_shell("arandr") end },
                    { "󱍷 refresh", awesome.restart },
                    { "󰍃 logout", function() awesome.quit() end},
                    { " restart", function() awful.spawn.with_shell("systemctl reboot") end },
                    { "⏻ power off",  function() awful.spawn.with_shell("systemctl poweroff") end }
                    -- { "󰋗  hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end }
                },
        theme = {
            font = "RobotoMono Nerd Font 12",
            height = 20,
            width = 200,
            bg_normal = beautiful.bg_normal,
            fg_normal = beautiful.fg_normal,
            bg_focus = beautiful.bg_focus,
            fg_focus = beautiful.fg_focus
    }
})