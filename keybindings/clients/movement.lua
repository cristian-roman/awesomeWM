local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")

return{
    keybind_creator("o", nil, function (c) c:move_to_screen() end, "move to screen", "client"),
    keybind_creator("0", nil, function (c) c:swap(awful.client.getmaster()) end, "move to master", "client"),
    keybind_creator("v", nil, function (c) c.floating = not c.floating end, "toggle floating", "client"),
}