local gears = require("gears")
local client_keys = gears.table.join(
    require("keybindings.clients.size_control"),
    require("keybindings.clients.quit"),
    require("keybindings.clients.interactions"),
    require("keybindings.clients.movement")
)

return client_keys