return require("awful").key(

    -- key combination
    { require("variables").modkey }, "Down",

    -- function
    function (c)
        c.minimized = true
    end,
    
    -- description & group
    {description = "minimize", group = "client"}
)