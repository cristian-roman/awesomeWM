local os = os

local function set_env_variables(theme)
    theme.themes_dir = os.getenv("HOME") .. "/.config/awesome/themes"
    theme.icons_dir = theme.themes_dir .. "/utils/icons"
    theme.walls_dir = theme.themes_dir .. "/utils/walls"
end

return set_env_variables