local set_border_width = require("themes.crispor.border.width")
local set_border_colors = require("themes.crispor.border.colors")

local function set_border_theme(theme)
    set_border_width(theme)
    set_border_colors(theme)
end

return set_border_theme