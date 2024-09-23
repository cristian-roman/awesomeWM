-- Dependencies
local awful = require("awful") 
local menubar = require("menubar") 

-- Standard Awesome library
local hotkeys_popup = require("awful.hotkeys_popup") 
require("awful.hotkeys_popup.keys") 

-- Variables
local vars = require("global_variables")

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

submenu = {
    { "󰌏  Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "󰑓  Restart", awesome.restart },
    { "  Quit", function() awesome.quit() end },
 }

 return submenu