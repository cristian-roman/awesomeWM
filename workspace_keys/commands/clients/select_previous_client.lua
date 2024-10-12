return require("awful").key(
    
    -- key combination
    { require("variables").modkey, "Control" }, ",", 
    
    -- function
    function () 
        awful.client.focus.byidx(-1) 
    end, 
    
    -- description & group
    {description = "focus previous by index", group = "client"}
)
