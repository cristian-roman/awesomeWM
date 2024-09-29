--awesome core libraries
local awful = require("awful") 
local wibox = require("wibox") 

local function init()

    local set_wallpaper = require("screens.helpers.set_wallpaper")
    
    -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
    screen.connect_signal("property::geometry", set_wallpaper)

    require("awful.autofocus")

    awful.screen.connect_for_each_screen(
        
        function(s)

            set_wallpaper(s)
        
            -- Each screen has its own tag table.
            awful.tag({ "🚀" }, s, awful.layout.layouts[1])
            require("screens.tags.browser").attach(s)
    
            s.layoutbox = require("screens.widgets.layoutbox").init(s)
            s.taglist = require("screens.widgets.taglist").init(s)
            s.tasklist = require("screens.widgets.tasklist").init(s)
        
            -- Create the wibox
            s.wibox = awful.wibar({ 
                position = "top",
                height = 25, 
                border_width = 5,
                border_color = "#1e2c42",
                bg = "#10203b",
                screen = s,
            })
        
            -- Add widgets to the wibox
            s.wibox:setup {
                layout = wibox.layout.align.horizontal,
                { 
                    -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    require("screens.widgets.launcher"),
                    s.taglist,
                    s.tasklist,
                },
                {
                    -- Middle widget
                    layout = wibox.layout.fixed.horizontal,
                    wibox.widget.textclock(),
                    
                },
                {   
                    -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    awful.widget.keyboardlayout(),
                    s.layoutbox,
                },
            }
        end
    )

    require("screens.controls.desktop")
end

return {
    init = init
}