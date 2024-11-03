local normal = "#022c42"
local focus = "#0099CC"

local function set_border_colors(theme)
    theme.border_normal = normal or "#022c42"
    theme.border_focus = theme.blue_16 or focus or "#0099CC"
end

return set_border_colors
    