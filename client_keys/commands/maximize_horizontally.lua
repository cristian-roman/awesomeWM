return require("awful").key(
    
    -- key combination
    { require("variables").modkey, "Control" }, "h",
    
    -- function
    function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end,
    
    -- description & group
    {description = "(un)maximize horizontally", group = "client"}
)