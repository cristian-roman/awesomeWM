local awful = require("awful")
local beautiful = require("beautiful")
local menu = require("screens.components.menu")

launcher = awful.widget.launcher({  image = beautiful.awesome_icon,
                                     menu = menu })
return launcher