local terminal = require("variables").terminal
return 
    keybind_creator("Return", nil, function () awful.spawn(terminal) end, "open a terminal", "launcher")