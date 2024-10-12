local awful = require("awful")
return awful.key(

    -- key combination
    { require("variables").modkey }, "-",
    
    -- function
    function () 
        awful.tag.incmwfact(-0.05) 
    end, 
    
    -- description & group
    {description = "decrease master width factor", group = "layout"}
)
