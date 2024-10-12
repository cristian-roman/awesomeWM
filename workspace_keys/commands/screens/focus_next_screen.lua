local awful = require("awful")

return awful.key(
    
    -- key combination
    { require("variables").modkey }, ".",
    
    -- function
    function () 
        awful.screen.focus_relative(1) 
    end, 

    {description = "focus the next screen", group = "screen"}
)
