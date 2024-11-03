local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local launcher_icon_file = "arch_48.png"

local function get_arch_menu_launcher(theme)
    local launcher_icon_path = theme.icons_dir .. "/" .. launcher_icon_file

    -- Create the launcher button
    local launcher_button = awful.widget.button({ 
        image = launcher_icon_path,
    })

    launcher_button.resize = true

    -- Wrap the launcher in a background container with a red color
    local launcher = wibox.widget {
        {
            launcher_button,
            bg = theme.blue_8 .. "40",
            shape = gears.shape.circle,
            widget = wibox.container.background
        },
        -- Add a margin with theme.useless_gap to create distance from the top
        right = theme.useless_gap * 2.75,
        top = theme.useless_gap * 1.5,
        bottom = theme.useless_gap * 1.5,
        widget = wibox.container.margin
    }

    -- Optionally add a signal for clicking
    -- launcher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

    return launcher
end

return get_arch_menu_launcher
