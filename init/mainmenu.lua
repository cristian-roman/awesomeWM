local hotkeys_popup = require("awful.hotkeys_popup")
local terminal = require("variables").terminal
local editor_cmd = require("variables").editor_cmd
local beautiful = require("beautiful")
local awful = require("awful")


awful.util.mymainmenu = awful.menu({ 
        items = {  
                    { "  open terminal", terminal },
                    { "󱍷  refresh", awesome.restart },
                    { "󰍃  logout", function() awesome.quit() end},
                    { "⏻  power off",  function() awful.spawn.with_shell("systemctl poweroff") end },
                    { "  restart", function() awful.spawn.with_shell("systemctl reboot") end }
                    -- { "󰋗  hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end }
                }
    }
)