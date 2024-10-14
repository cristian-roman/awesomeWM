local gears = require("gears")
local shift_pressed = false
local double_shift_timer = gears.timer {
    timeout = 0.5, -- half-second window for detecting double press
    autostart = false,
    callback = function()
        shift_pressed = false
    end
}

local keybind_creator = require("keybindings.keybind_creator")
local awful = require("awful")
local menubar = require("menubar")

return 
    awful.key({}, "Shift_L", 
    function()
        if shift_pressed then
            menubar.show()
            shift_pressed = false
            double_shift_timer:stop()
        else
            shift_pressed = true
            double_shift_timer:start()
        end
    end,
    {description = "show the menubar", group = "launcher"})