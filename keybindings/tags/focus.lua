local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")

return{
    keybind_creator("Right", nil, awful.tag.viewnext, "view next tag", "tag"),
    keybind_creator("Left", nil, awful.tag.viewprev, "view previous tag", "tag"),
    keybind_creator("Tab", nil, awful.tag.history.restore, "restore last tag", "tag")
}