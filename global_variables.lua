local awful = require("awful")

-- This is used later as the default terminal and editor to run.
local variables = {}

variables.terminal = "alacritty"
variables.editor = os.getenv("EDITOR") or "nano"
variables.editor_cmd = variables.terminal .. " -e " .. variables.editor
variables.modkey = "Mod4"
variables.browser = "chromium"
variables.file_manager = "thunar"

-- Table of layouts to cover with awful.layout.inc, order matters.
variables.layouts = {
    awful.layout.suit.tile.left,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.magnifier,
    awful.layout.suit.max,
    awful.layout.suit.floating
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

awful.layout.layouts = variables.layouts

local initiated = false

function variables:get(name)
    if not initiated then
        variables.terminal = "alacritty"
        variables.editor_cmd = variables.terminal .. " -e " .. variables.editor
        variables.modkey = "Mod4"
        variables.browser = "chromium"
        variables.file_manager = "thunar"
        -- layouts
        variables.layouts = variables.layouts   -- after checking if the variable is not used anywhere else remove this line
        awful.layout.layouts = variables.layouts
        initiated = true
    end
    return variables[name]
end

return variables