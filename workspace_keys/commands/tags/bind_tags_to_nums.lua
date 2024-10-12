local gears = require("gears")
local awful = require("awful")
local modkey = require("variables").modkey

function bind_tags_to_nums(globalkeys)
    for i = 1, 9 do
        globalkeys = gears.table.join(globalkeys,

            -- View tag only.
            awful.key(
                    
                -- key combination
                { modkey }, "#" .. i + 9,
                    
                --function
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                                
                    if tag then
                        tag:view_only()
                    end
                end,
                    
                --description & group
                {description = "view tag #"..i, group = "tag"}
            ),


            -- Toggle tag display.
            awful.key(
                
                -- key combination
                { modkey, "Shift" }, "#" .. i + 9,
                

                --function
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        awful.tag.viewtoggle(tag)
                    end
                end,
                
                -- description & group
                {description = "toggle tag #" .. i, group = "tag"}
            ),
            
            -- Move client to tag.
            awful.key(
                
                -- key combination
                { modkey, "Control" }, "#" .. i + 9,
                
                function ()
                    if client.focus then
                    local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                        end
                    end
                end,
                
                -- description & group
                {description = "move focused client to tag #"..i, group = "tag"}
            ),
            
            -- Toggle tag on focused client.
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

    return globalkeys
end

return
{
    bind_tags_to_nums = bind_tags_to_nums
}