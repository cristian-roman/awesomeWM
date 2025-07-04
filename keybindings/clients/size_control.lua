local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")
local gears = require("gears")

return gears.table.join(
    keybind_creator("f", nil, function (c) c.fullscreen = not c.fullscreen; c:raise() end, "toggle fullscreen", "client"),
    keybind_creator("h", "Control", function (c) c.maximized_horizontal = not c.maximized_horizontal; c:raise() end, "toggle maximize horizontally", "client"),
    keybind_creator("v", "Control", function (c) c.maximized_vertical = not c.maximized_vertical; c:raise() end, "toggle maximize vertically", "client"),
    keybind_creator("Up", nil, function(c) c.maximized = not c.maximized; c:raise() end, "toggle maximize", "client"),
    keybind_creator("=", nil, function () awful.tag.incmwfact(0.05) end, "increase master width factor", "layout"),
    keybind_creator("-", nil, function () awful.tag.incmwfact(-0.05) end, "decrease master width factor", "layout"),
    
    keybind_creator("Down", nil, function (c) c.minimized = true end, "minimize", "client"),
    keybind_creator("Down", "Shift", function () local c = awful.client.restore(); if c then c:emit_signal("request::activate", "key.unminimize", {raise = true}) end end, "restore minimized", "client")
)