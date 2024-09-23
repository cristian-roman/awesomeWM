--Dependencies
local beautiful = require("beautiful")
local awful = require("awful")

-- Style
require("screens.components.menu.style")

-- global variables
local vars = require("global_variables")

-- Subcomponents
local submenu = require("screens.components.menu.submenu")

local menu =  awful.menu({
    items = { { " Awesome", submenu},
              { "  Terminal", vars:get("terminal") },
              { "  Browser", vars:get("browser")},
              { "  Files", vars:get("file_manager")}
            }
})

return menu