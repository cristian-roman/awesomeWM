local awful = require("awful")
local gears = require("gears")

local function open_app_in_tag(app_class, app_name, tag, app_event_table)
    
    for _, c in ipairs(tag:clients()) do
        if c.class == app_class then
            app_event_table.running = true
            break
        end
    end

    if not app_event_table.running and not app_event_table.opening then
        app_event_table.opening = true
        awful.spawn.with_shell(app_name)
        
        gears.timer.start_new(5, function()
            app_event_table.opening = false
            return false
        end)
    end
end

return open_app_in_tag