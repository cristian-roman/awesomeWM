local awful = require("awful")
local gears = require("gears")

local variables = require("variables")

awful.layout.layouts = variables:get("layouts")

local function init(s)
    local layoutbox = awful.widget.layoutbox(s)

    layoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)
    ))
    
    return layoutbox
end

return 
{
    init = init
}