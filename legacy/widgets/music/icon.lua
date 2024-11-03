local wibox = require("wibox")
local gears = require("gears")
local lain = require("lain")

local musicplr = "spotify"

local function get_music_widget(theme)
    local music_icon = theme.icon_dir .. "/sound/mpd.png"
    local music_launcher = awful.widget.launcher({ image = music_icon, command = ( musicplr or 'spotify' ) })

    return music_launcher
end

return get_music_widget