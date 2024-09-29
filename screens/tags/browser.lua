local awful = require("awful")
local gears = require("gears")
local open_app_function = require("screens.helpers.open_app")

-- Function to attach a tag to a screen
local function attach(s)
    -- Define the tag name and properties
    local tag_name = ""
    
    -- Directly add the tag to the screen's tag list without searching
    local tag = awful.tag.add(tag_name, {
        screen = s,
        layout = awful.layout.layouts[1],
        selected = false,
    })
    
    -- Flag to prevent multiple Chromium launches
    local chromium_event_table = { running = false, opening = false }

    -- Connect to the tag's activation signal
    tag:connect_signal("property::selected", function()
        if tag.selected then
            -- Only open Chromium if it isn't currently launching
            if not chromium_event_table.opening then
                open_app_function("Chromium", "chromium", tag, chromium_event_table)
            end
        end
    end)
end

-- Return the function to be required
return {
    attach = attach
}
