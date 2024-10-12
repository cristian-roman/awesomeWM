local gears = require("gears")

local clientkeys = gears.table.join(
    require("client_keys.commands.fullscreen"),
    require("client_keys.commands.close"),
    require("client_keys.commands.toggle_floating"),
    require("client_keys.commands.move_to_master"),
    require("client_keys.commands.change_screen"),
    require("client_keys.commands.stay_on_top"),
    require("client_keys.commands.minimize"),
    require("client_keys.commands.maximize"),
    require("client_keys.commands.maximize_vertically"),
    require("client_keys.commands.maximize_horizontally")
)

return clientkeys