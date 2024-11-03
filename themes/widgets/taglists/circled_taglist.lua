-- Required Libraries
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Function to create the taglist widget
local function create_taglist(s, theme)
    -- Taglist widget
    local base_taglist_widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        layout  = {
            spacing = 20,
            layout  = wibox.layout.fixed.horizontal,
        },
        style   = {
            shape = gears.shape.circle,
            bg_focus = theme.blue_8,
            bg_urgent = "#ffccd5",
        },
        widget_template = {
            {
                widget = wibox.container.margin,
                margins = dpi(5),
            },
            id = "background_role",
            widget = wibox.container.background,
            create_callback = function(self, tag, index, objects)
                self:connect_signal("mouse::enter", function()
                    if self.bg ~= theme.blue_2 then
                        self.backup     = self.bg
                        self.has_backup = true
                    end
                    self.bg = theme.blue_2
                end)
                self:connect_signal("mouse::leave", function()
                    if self.has_backup then self.bg = self.backup end
                end)
            end,
            update_callback = function(self, tag, index, objects)
            end,
        },
    }

    local taglist_container = wibox.widget{
        {
            {
                base_taglist_widget,
                margins = dpi(10),
                widget = wibox.container.margin
            },
        
            bg = theme.blue_1,
            shape = gears.shape.rounded_bar,
            widget = wibox.container.background
        },

        top = theme.useless_gap * 2,
        left = theme.useless_gap * 2.75,
        widget = wibox.container.margin
    }

    return taglist_container
end

-- Return the function to generate the taglist widget
return create_taglist
