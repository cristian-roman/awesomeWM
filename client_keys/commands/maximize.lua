return require("awful").key(
    
    -- key combination
    { require("variables").modkey }, "Up",
        
    -- function
    function (c)
        c.maximized = not c.maximized
            c:raise()
    end,
    
    -- description & group
    {description = "(un)maximize", group = "client"}
)
