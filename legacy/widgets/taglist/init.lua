local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local focus_color = "#334D60"

local taglist = {}

local function taglist.attach_taglist(themes, s)
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, 
    { 
        bg_focus = background_color, 
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 8) 
        end,
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(4)
    })

    mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_focus, gears.shape.rectangle)
    s.mytag = wibox.container.margin(mytaglistcont, dpi(0), dpi(0), dpi(5), dpi(5))
end

return taglist