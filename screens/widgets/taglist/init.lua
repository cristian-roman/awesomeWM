local awful = require("awful")
local wibox = require("wibox")
local function init(s)
    local taglist_style = require("screens.widgets.taglist.style")
    local taglist_controls = require("screens.widgets.taglist.controls")
    
    local taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_controls,
        layout = {
            spacing = 5,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
          {
            {
                id = 'text_role',
                widget = wibox.widget.textbox,

            },
            widget = wibox.container.margin,
            margins = 5
          },
            id = 'background_role',
            widget = wibox.container.background,
        },
        style = taglist_style
    }

    return taglist
end

return 
{
    init = init
}