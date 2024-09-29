local awful = require("awful")
local wibox = require("wibox")

local function init(s)
    local tasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = require("screens.widgets.tasklist.controls"),
        bg = "#10203b",
        style = require("screens.widgets.tasklist.style"),
        layout   = {
            spacing = 8,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    layout = wibox.layout.align.horizontal,
                },
                widget = wibox.container.margin,
            },
            id = 'background_role',
            widget = wibox.container.background,
        
        },
    }

    return tasklist
end

return {
    init = init
}