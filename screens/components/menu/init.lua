--Dependencies
local beautiful = require("beautiful")
local awful = require("awful")

-- Subcomponents
local submenu = require("screens.components.menu.submenu")

local menu =  awful.menu({
    items = { { "awesome", submenu, beautiful.awesome_icon },
              { "open terminal", terminal }
            }
})

return menu