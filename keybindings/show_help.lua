local awful = require("awful")
local modkey = require("variables").modkey
local hotkeys_popup = require("awful.hotkeys_popup")
local keybind_creator = require("keybindings.keybind_creator")

return keybind_creator("h", nil, function () hotkeys_popup.show_help(nil, awful.screen.focused()) end, "show help", "awesome")