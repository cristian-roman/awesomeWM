require keybind_creator = require("keybindings.keybind_creator")

return {
    keybind_creator("l", nil, awesome.quit, "quit awesome", "awesome"),
    keybind_creator("r", nil, awesome.restart, "restart awesome", "awesome")
}