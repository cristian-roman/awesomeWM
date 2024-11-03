local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local function get_tasklist(s, theme)
    base_task_list = awful.widget.tasklist{
        screen = s,
        filter = function (c)
            return c == client.focus
        end,
        buttons = awful.util.tasklist_buttons,
        style = {
            shape = gears.shape.rounded_rect,
            bg_focus = theme.blue_8,
            shape_border_width = 2,
            shape_border_color = theme.blue_2,
            align = "center"
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox,
                        },
                        margins = dpi(4),
                        widget = wibox.container.margin
                    },
                    {
                        id = "text_rol",
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                left = dpi(5),
                right = dpi(10),
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background,
            create_callback = function(self, c, index, clients)
                first_dash_index = string.find(c.name, "-")
                if first_dash_index then
                    self:get_children_by_id("text_rol")[1].markup = "<b>" .. string.sub(c.name, 1, first_dash_index - 1) .. "</b>"
                else
                    self:get_children_by_id("text_rol")[1].markup = "<b>" .. c.name .. "</b>"
                end
            end,
        },
    }

    local task_list_widget = wibox.widget{
        base_task_list,
        left =theme.useless_gap * 2.75,
        top = theme.useless_gap * 1.5,
        bottom = theme.useless_gap * 1.5,
        widget = wibox.container.margin
    }

    return task_list_widget
end

return get_tasklist