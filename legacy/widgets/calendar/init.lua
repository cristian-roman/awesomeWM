local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local function get_calendar_widget(theme)

    local mytextcalendar = wibox.widget.textclock(
        markup.fontfg(
            theme.text_font_normal, 
            theme.text_color_normal, 
            "%d %b " .. markup.font(theme.text_font_name .. " 5", " ")
        )
    )
    
    local calendar_container = wibox.container.background(mytextcalendar, theme.bg_normal, gears.shape.rectangle)
    local calendarwidget = wibox.container.margin(calbg, dpi(0), dpi(0), dpi(5), dpi(5))
    
    return calendarwidget
end

return get_calendar_widget