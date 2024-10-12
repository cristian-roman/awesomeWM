local awful = require("awful")

return awful.key(
    
    -- key combination
    { require("variables").modkey, "Shift"  }, "Right",
    
    -- function
    function () 
        awful.client.swap.byidx(1) 
    end, 
    
    -- description & group
    {description = "swap with next client by index", group = "client"}
)
