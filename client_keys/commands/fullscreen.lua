return require("awful").key(

    -- key combination
    { require("variables").modkey }, "f",
    
    -- function
    function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end,
    
    --description & group
    {description = "toggle fullscreen", group = "client"}
)