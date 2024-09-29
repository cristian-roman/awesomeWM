local gears = require("gears")
local beautiful = require("beautiful")

local style = 
{    
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 10)
    end,
}

return style