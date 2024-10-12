return require("awful").key(
    
    -- key combination
    { require("variables").modkey, "Ctrl" }, "q",
    
    -- function
    function (c) 
        c:kill() 
    end, 
    
    -- description & group
    {description = "close", group = "client"}
)
