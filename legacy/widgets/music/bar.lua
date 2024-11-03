local lain = require("lain")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local os = os

local function get_music_bar_widget(theme)
    local music_bar = 
        
        lain.widget.alsabar({
        notification_preset = { font = theme.text_font_name .. " 9" },
    
        width = dpi(80), height = dpi(10), border_width = dpi(0),
        colors = {
            background = theme.bg_dark_focus,
            unmute     = "#80CCE6",
            mute       = "#FF9F9F"
        },
    
        timeout = 1
    })
    music_bar.bar.paddings = dpi(0)
    music_bar.bar.margins = dpi(5)
    local volumewidget = wibox.container.background(music_bar.bar, theme.bg_light_focus, gears.shape.rectangle)
    volumewidget = wibox.container.margin(volumewidget, dpi(0), dpi(0), dpi(5), dpi(5))
    
    volumewidget:buttons(my_table.join(
        awful.button({}, 4, function() os.execute("amixer -q set Master 2%+ unmute"); music_bar.update() end),
        awful.button({}, 5, function() os.execute("amixer -q set Master 2%- unmute"); music_bar.update() end),
        awful.button({}, 1, function() os.execute("amixer -q set Master toggle"); music_bar.update() end)
    ))

    return volumewidget

end

return get_music_bar_widget
    