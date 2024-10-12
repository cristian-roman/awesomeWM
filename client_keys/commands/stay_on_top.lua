return require("awful").key(

    -- key combination
    { require("variables").modkey }, "t",
   
    -- function
    function (c) 
        c.ontop = not c.ontop 
    end, 
    
    -- description & group
    {description = "toggle keep on top", group = "client"}
)
