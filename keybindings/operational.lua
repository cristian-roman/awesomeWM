local keybind_creator = require("keybindings.keybind_creator")
local gears = require("gears")

return gears.table.join (
    keybind_creator("q", "Control", awesome.quit, "quit awesome", "awesome"),
    keybind_creator("r", "Control", awesome.restart, "restart awesome", "awesome")
)