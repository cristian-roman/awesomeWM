local terminal = require("variables").terminal
local keybind_creator = require("keybindings.keybind_creator")
return 
    keybind_creator("Return", nil, function () awful.spawn(terminal) end, "open a terminal", "launcher")