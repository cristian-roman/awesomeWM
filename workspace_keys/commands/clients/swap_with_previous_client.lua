local awful = require("awful")

return awful.key(
    
    -- Key combination
    { require("variables").modkey, "Shift"  }, "Left", 
    
    -- function
    function () 
        awful.client.swap.byidx(-1) 
    end, 
    
    -- description & group
    {description = "swap with previous client by index", group = "client"}
)
