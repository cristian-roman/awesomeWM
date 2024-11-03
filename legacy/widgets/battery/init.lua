local wibox = require("wibox")
local lain = require("lain")
local dpi = require("beautiful.xresources").apply_dpi

local function get_battery_widget(theme)
    
    local bat = lain.widget.bat({
        settings = function()
            bat_header = " Bat "
            bat_p      = bat_now.perc .. " "
            if bat_now.ac_status == 1 then
                bat_p = bat_p .. "Plugged "
            else
                bat_p = bat_p .. "%" .. " "
            end
            widget:set_markup(markup.font(theme.text_font_normal, markup(blue, bat_header) .. bat_p))
        end
    })

    local bat_container = wibox.container.background(bat.widget, theme.bg_light_focus, gears.shape.rectangle)
    local batterywidget = wibox.container.margin(bat_container, dpi(0), dpi(0), dpi(5), dpi(5))

    return batterywidget

end

return get_battery_widget