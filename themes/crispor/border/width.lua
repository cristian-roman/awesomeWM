local dpi = require("beautiful.xresources").apply_dpi

local width = dpi(3)

local function set_border_width(theme)
    theme.border_width = width or dpi(3)
end

return set_border_width