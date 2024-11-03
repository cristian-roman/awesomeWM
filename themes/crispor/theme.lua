local gears = require("gears")
local awful = require("awful")
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}

local wallpaper_file = "wall.jpg"

local set_env_variables = require("themes.scripts.set_env_variables")
local set_border_theme = require("themes.crispor.border")
local attach_top_wibar = require("themes.crispor.wibars.top_wibar")

theme.useless_gap = dpi(2)

theme.blue_0 = "#011a28"
theme.blue_1 = "#022c42"
theme.blue_2 = "#4D6F80"
theme.blue_8 = "#a3c4cf"
theme.blue_16 = "#0099CC"

theme.pink_8 = "#f2d4d7"

set_border_theme(theme)

function theme.at_screen_connect(s)
    set_env_variables(theme)
    local wallpaper = theme.walls_dir .. "/" .. wallpaper_file
    
    local set_wallpaper = require("themes.scripts.set_wallpaper")
    set_wallpaper(s, theme)
    
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    attach_top_wibar(s, theme)
end

theme.font = "FiraMono Nerd Font Bold 12"

return theme