--Dependencies
local beautiful = require("beautiful")
local awful = require("awful")

-- global variables
local vars = require("global_variables")

-- Subcomponents
local submenu = require("screens.components.menu.submenu")

beautiful.menu_height = 20

local menu =  awful.menu({
    items = { { "awesome", submenu, beautiful.awesome_icon },
              { "open terminal", terminal },
              { "Browser", vars:get("browser")},
              { "File manager", vars:get("file_manager")}
            }
})

return menu