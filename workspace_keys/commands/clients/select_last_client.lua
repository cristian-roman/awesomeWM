local awful = require("awful")

return awful.key(
    
    -- key combination
    { require("variables").modkey }, "\\",
    
    -- function
    function () 
        awful.client.focus.history.previous() 
        
        if client.focus then client.focus:raise() 
        end 
    end, 

    -- description & group
    {description = "go back", group = "client"}
)
