local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local get_launcher = require("themes.widgets.menu_launchers.arch_menu_launcher")
local get_clock = require("themes.widgets.clocks.rounded_clock")
local get_taglist = require("themes.widgets.taglists.circled_taglist")
local get_tasklist = require("themes.widgets.tasklists.focused_tasklist")

local function attach_top_wibar(s, theme)
    s.top_wibar = awful.wibar({
        position = "top",
        screen = s,
        bg = theme.blue_0.. "D9",
        fg = "#FFFFFF",
        height = dpi(36)
    })

    s.top_wibar:setup{
        layout = wibox.layout.flex.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            get_tasklist(s, theme)
        },
        wibox.container.place(get_clock(theme), "center"),
        {
            layout = wibox.layout.align.horizontal,
            nil,
            nil,{
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(20),
                get_taglist(s, theme),
                get_launcher(theme),
            }
        },
    }
end

return attach_top_wibar