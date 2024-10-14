local gears = require("gears")

local globalkeys = gears.table.join(
    require("keybindings.apps_launcher"),
    require("keybindings.tags.focus"),
    require("keybindings.operational"),
    require("keybindings.screens"),
    require("keybindings.show_help"),
    require("keybindings.tags.bind_tags_to_nums")
)

root.keys(globalkeys)