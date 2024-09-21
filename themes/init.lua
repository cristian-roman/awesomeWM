local beautiful = require("beautiful")

local function load()
    beautiful.init("/home/cristian.roman/.config/awesome/themes/default/theme.lua")
end

return {
    load = load
}