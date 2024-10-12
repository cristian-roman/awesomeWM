local keybind_creator = require("keybindings.keybind_creator")

return {
    keybind_creator("q", nil, function (c) c:kill() end, "close", "client")
}