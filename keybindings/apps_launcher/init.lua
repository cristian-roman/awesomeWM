local gears = require("gears")

return gears.table.join(
    require("keybindings.apps_launcher.file_manager"),
    require("keybindings.apps_launcher.spotlight"),
    require("keybindings.apps_launcher.terminal")
)