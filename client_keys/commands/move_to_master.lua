return require("awful").key(
    
    -- key combination
    { require("variables").modkey, }, "m",
    
    -- function
    function (c) 
        c:swap(awful.client.getmaster()) 
    end,
    
    -- description & group
    {description = "move to master", group = "client"}
)