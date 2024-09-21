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
    items = { { "awesome", submenu, beautiful.awesome_icon },
              { "open terminal", vars:get("terminal") },
              { "Browser", vars:get("browser")},
              { "File manager", vars:get("file_manager")}
            }
})

return menu