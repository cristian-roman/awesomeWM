local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")
local gears = require("gears")

return gears.table.join(
    keybind_creator("Right", "Control", awful.tag.viewnext, "view next tag", "tag"),
    keybind_creator("Left", "Control", awful.tag.viewprev, "view previous tag", "tag"),
    keybind_creator("Tab", nil, awful.tag.history.restore, "restore last tag", "tag")
)