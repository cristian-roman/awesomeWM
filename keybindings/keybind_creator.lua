local awful = require("awful")
local modkey = require("variables").modkey

local function create_keybind(primary_key, second_key, action, description, group)    
    if second_key == nil then
        return awful.key(
            { modkey }, primary_key, action, {description = description, group = group})
    else
        return awful.key(
            {modkey, second_key}, primary_key, action, {description = description, group = group})
    end
end

return create_keybind