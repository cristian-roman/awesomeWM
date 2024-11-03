local set_text_colors = require("themes.components.basic.text.colors")
local set_text_fonts = require("themes.components.basic.text.fonts")

local function set_text_theme(theme)
    set_text_colors(theme)
    set_text_fonts(theme)
end

return set_text_theme