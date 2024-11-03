local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local function get_clock_widget(theme)
    -- Define separate textclock widgets for time and date
    local time_widget = wibox.widget{
        format = "%a, %I:%M:%S %p",
        widget = wibox.widget.textclock,
        refresh = 1
    }

    local date_widget = wibox.widget{
        format = "%d %b. %Y",
        widget = wibox.widget.textclock,
        refresh = 60
    }

    -- Define a separator
    local separator = wibox.widget {
        markup = '<span color="#FFFFFF">|</span>',
        widget = wibox.widget.textbox,
    }

    -- Arrange them in a horizontal layout with the separator in between
    local base_clock_widget = wibox.widget{
        -- Add margin around each element to control spacing
        {
            time_widget,
            right = dpi(8),  -- Adjust this value to control spacing
            widget = wibox.container.margin
        },
        {
            separator,
            left = dpi(8),
            right = dpi(8),  -- Adjust this value for separator padding
            widget = wibox.container.margin
        },
        {
            date_widget,
            left = dpi(8),  -- Adjust this value to control spacing
            widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
    }
    

    local clock_widget = wibox.widget{
        {
            {
                base_clock_widget,
                right = theme.useless_gap * 3,
                left = theme.useless_gap * 3,
                widget = wibox.container.margin
            },
            -- bg = theme.blue_8,
            fg = "#FFFFFF",
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, dpi(4))
            end,
            widget = wibox.container.background
        },
        top = theme.useless_gap * 1.5,
        bottom = theme.useless_gap * 1.5,
        widget = wibox.container.margin
    }

    return clock_widget
end

return get_clock_widget
