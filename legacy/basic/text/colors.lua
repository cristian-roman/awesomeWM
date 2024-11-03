local normal = "#FFFFFF"
local focus  = "#4CB7DB"
local urgent = "#e84343"

local function set_text_colors(theme)
    theme.text_color_normal = normal or "#FFFFFF"
    theme.text_color_focus = focus or "#4CB7DB"
    theme.text_color_urgent = urgent or "#e84343"
end

return set_text_colors