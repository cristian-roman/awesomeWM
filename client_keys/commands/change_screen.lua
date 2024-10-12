return require("awful").key(
    
    -- key combinations
    { require("variables").modkey }, "o",

    -- function
    function (c) 
        c:move_to_screen() 
    end, 
    
    -- description & group
    {description = "move to screen", group = "client"}
)
