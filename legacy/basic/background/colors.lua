local normal = "#022c42"
local light_focus = "#466A7C"
local dark_focus = "#334D60"
local urgent = "#1F2F43"

local function set_background_colors(theme)
    theme.bg_normal = normal or "#022c42"
    theme.bg_light_focus = light_focus or "#466A7C"
    theme.bg_dark_focus = dark_focus or "#334D60"
    theme.bg_urgent = urgent or "#1F2F43"
end

return set_background_colors