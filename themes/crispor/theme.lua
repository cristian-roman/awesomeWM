local gears = require("gears")
local awful = require("awful")
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}

local wallpaper_file = "wall.jpg"

local set_wallpaper = require("themes.utils.scripts.set_wallpaper")
local set_env_variables = require("themes.utils.scripts.set_env_variables")

local set_color_palette = require("themes.crispor.styles.color_palette")
local set_clients_borders_properties = require("themes.crispor.styles.border")

local attach_top_wibar = require("themes.crispor.containers.wibars.top_wibar")

theme.useless_gap = dpi(2)

function theme.at_screen_connect(s)
    set_env_variables(theme)
    set_wallpaper(s, theme, wallpaper_file)
    
    set_color_palette(theme)
    set_clients_borders_properties(theme)
    
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    attach_top_wibar(s, theme)
end

theme.font = "FiraMono Nerd Font Bold 12"

return theme