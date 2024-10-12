return require("awful").key(
    
    -- key combination
    { require("variables").modkey, "Shift" }, "Down",
    
    -- function
    function ()
        local c = awful.client.restore()
        
        if c then
            c:emit_signal(
                "request::activate", "key.unminimize", {raise = true}
            )
        end
    end,

    -- description & group
    {description = "restore minimized", group = "client"}
)