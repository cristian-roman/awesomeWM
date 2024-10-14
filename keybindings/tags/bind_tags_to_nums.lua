local gears = require("gears")
local awful = require("awful")
local keybind_creator = require("keybindings.keybind_creator")

local keybinds = nil

for i = 1, 5 do
    keybinds = gears.table.join(keybinds,
        -- View tag only.
        keybind_creator("#" .. i + 9, nil, function () local screen = awful.screen.focused() local tag = screen.tags[i] if tag then tag:view_only() end end, "view tag #"..i, "tag"),

        -- Toggle tag display.
        keybind_creator("#" .. i + 9, "Shift", function () local screen = awful.screen.focused() local tag = screen.tags[i] if tag then awful.tag.viewtoggle(tag) end end, "toggle tag #"..i, "tag"),

        -- Move client to tag.
        keybind_creator("#" .. i + 9, "Control", function () if client.focus then local tag = client.focus.screen.tags[i] if tag then client.focus:move_to_tag(tag) end end end, "move focused client to tag #"..i, "tag"),

        -- Toggle tag on focused client
        awful.key(
        -- key combination
        { modkey, "Control", "Shift" }, "#" .. i + 9,
        
        function ()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
                    
        -- description & group
        {description = "toggle focused client on tag #" .. i, group = "tag"}
    )   
)
end
    
return keybinds