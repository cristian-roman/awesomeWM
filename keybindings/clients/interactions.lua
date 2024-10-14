local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")
local gears = require("gears")

return gears.table.join (
    keybind_creator("t", nil, function (c) c.ontop = not c.ontop end, "toggle ontop", "client"),
    keybind_creator("`", nil, function () awful.client.focus.history.previous(); if client.focus then client.focus:raise() end end, "go back", "client"),
    keybind_creator("Right", nil, function () awful.client.focus.byidx(1) end, "focus next by index", "client"),
    keybind_creator("Left", nil, function () awful.client.focus.byidx(-1) end, "focus previous by index", "client"),
    keybind_creator("Right", "Shift", function () awful.client.swap.byidx(1) end, "swap with next client by index", "client"),
    keybind_creator("Left", "Shift", function () awful.client.swap.byidx(-1) end, "swap with previous client by index", "client")
)   