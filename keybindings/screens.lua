local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")
local gears = require("gears")

return gears.table.join (
    keybind_creator(".", nil, function() awful.screen.focus_relative(1) end, "focus next screen", "screen"),
    keybind_creator(",", nil, function() awful.screen.focus_relative(-1) end, "focus previous screen", "screen")
)