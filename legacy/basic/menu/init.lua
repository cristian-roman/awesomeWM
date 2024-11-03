local dpi = require("beautiful.xresources").apply_dpi

local height = dpi(20)
local width = dpi(160)
local icon_size = dpi(32)

local function set_menu_theme(theme)
    theme.menu_height = height or dpi(20)
    theme.menu_width = width or dpi(160)
    theme.menu_icon_size = icon_size or dpi(32)
end