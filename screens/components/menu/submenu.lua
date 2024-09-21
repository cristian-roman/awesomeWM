-- Dependencies
local awful = require("awful") 
local menubar = require("menubar") 

-- Standard Awesome library
local hotkeys_popup = require("awful.hotkeys_popup") 
require("awful.hotkeys_popup.keys") 

-- Variables
local vars = require("global_variables")
local terminal = vars:get("terminal")
local editor_cmd = vars:get("editor_cmd")

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

submenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }

 return submenu