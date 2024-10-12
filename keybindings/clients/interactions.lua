local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")

return{
    keybind_creator("t", nil, function (c) c.ontop = not c.ontop end, "toggle ontop", "client"),
}