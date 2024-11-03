local beautiful = require("beautiful")
local gears = require("gears")

client.connect_signal("manage", function (c)
    if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
      require("awful").placement.no_offscreen(c)
    end
    
    c.shape = function(cr, width, height)
      return gears.shape.rounded_rect(cr, width, height, 8) -- Make it rounded
    end
end)
  
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false}) end)
  
client.connect_signal("focus", function(c) 
    c.border_color = beautiful.border_focus end)
    
client.connect_signal("unfocus", function(c) 
    c.border_color = beautiful.border_normal end)