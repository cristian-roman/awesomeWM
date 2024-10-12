local awful = require("awful")

return awful.key(

    -- key combination
    { require("variables").modkey }, ",", 
    
    -- function
    function () 
        awful.screen.focus_relative(-1) 
    end,
    
    -- description & group
    {description = "focus the previous screen", group = "screen"}
)
