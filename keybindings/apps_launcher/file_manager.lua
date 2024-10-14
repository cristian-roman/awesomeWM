local file_manager = require("variables").file_manager
local keybind_creator = require("keybindings.keybind_creator")
return 
    keybind_creator("e", nil, function () awful.spawn(file_manager) end, "open file explorer", "launcher")