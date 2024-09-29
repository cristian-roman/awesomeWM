--awesome core libraries
local beautiful = require("beautiful")
local gears = require("gears") 
local awful = require("awful") 
local wibox = require("wibox") 

-- components
local menu = require("screens.components.menu")
local mylauncher = require("screens.components.launcher")
mykeyboardlayout = awful.widget.keyboardlayout()
mytextclock = wibox.widget.textclock()

-- controls
local workspaces_controls =  require("screens.controls.workspaces")
local clients_controls =  require("screens.controls.clients")

local set_wallpaper = require("screens.helpers.set_wallpaper")

local function init()

    -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
    screen.connect_signal("property::geometry", set_wallpaper)
    awful.screen.connect_for_each_screen(function(s)
        -- Wallpaper
        set_wallpaper(s)
    
        -- Each screen has its own tag table.
        awful.tag( { "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    
        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()
        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(gears.table.join(
                               awful.button({ }, 1, function () awful.layout.inc( 1) end),
                               awful.button({ }, 3, function () awful.layout.inc(-1) end),
                               awful.button({ }, 4, function () awful.layout.inc( 1) end),
                               awful.button({ }, 5, function () awful.layout.inc(-1) end)))
        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            buttons = workspaces_controls,
        }
    
        -- Create a tasklist widget
        s.mytasklist = awful.widget.tasklist {
            screen  = s,
            filter  = awful.widget.tasklist.filter.currenttags,
            buttons = clients_controls,
            bg = "#10203b",
            style = {
                shape = gears.shape.rounded_rect,
            },
            layout   = {
                spacing = 10,
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
                        forced_width = 30,
                    },
                    left = 10,
                    right = 10,
                    widget = wibox.container.margin,
                },
                id = 'background_role',
                widget = wibox.container.background,
               
            },
        }
    
        -- Create the wibox
        s.mywibox = awful.wibar({ 
            position = "top",
            height = 30, 
            border_width = 5,
            border_color = "#1e2c42",
            bg = "#10203b",
            screen = s })
    
        -- Add widgets to the wibox
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { 
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mytasklist,
                forced_width = 600,
            },
            {
                -- Middle widget
                layout = wibox.layout.flex.horizontal,
                wibox.widget.systray(),
                mytextclock,
                
            },
            {   
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                s.mylayoutbox,
            },
        }
    end)
    require("screens.controls.desktop")
end

return {
    init = init
}