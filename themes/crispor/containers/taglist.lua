-- Required Libraries
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local naughty = require("naughty")

-- Function to create the taglist widget
local function create_taglist(s, theme)
    -- Taglist widget
    local base_taglist_widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        layout  = {
            spacing = dpi(20),
            layout  = wibox.layout.fixed.horizontal,
        },
        style = {
            shape = function (cr, width, height)
                local sh = gears.shape.rounded_rect
                sh = gears.shape.transform(sh):translate(0, 2.5)
                sh(cr, width, width, dpi(4))
            end,
            
            bg_focus = theme.blue_16,
            bg_urgent = theme.pink_8,
        },
        widget_template = {
            {
                {
                    id = 'text_role',
                    forced_width = dpi(25),
                    forced_height = dpi(25),
                    align = "center",
                    valign = "center",
                    widget = wibox.widget.textbox,
                },
                id = 'margin_role',
                bottom = dpi(3),
                right = 1.5,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
            create_callback = function(self, tag, index, tags)
                if index == 1 then
                    self:get_children_by_id('margin_role')[1].bottom = dpi(2)
                end
            end,
            update_callback = function(self, tag, index, tags)
            end,
        },
    }

    local taglist_container = wibox.widget{
        {
            {
                base_taglist_widget,
                left = dpi(15),
                right = dpi(15),
                widget = wibox.container.margin
            },
            bg = theme.blue_2,
            shape = function (cr, width, height)
                gears.shape.rounded_rect(cr, width, height, dpi(4))
            end,
            widget = wibox.container.background
        },
        top = theme.useless_gap * 1.5,
        bottom = theme.useless_gap * 1.5,
        widget = wibox.container.margin
    }

    return taglist_container
end

-- Return the function to generate the taglist widget
return create_taglist
