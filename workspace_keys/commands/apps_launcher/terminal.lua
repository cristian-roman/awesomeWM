local awful = require("awful")
local variables = require("variables")
return awful.key(
    
    -- key combination
    { variables.modkey }, "Return",
    
    -- function
    function () 
        awful.spawn(variables.terminal) 
    end, 
    
    -- description & group
    {description = "open a terminal", group = "launcher"}
)
