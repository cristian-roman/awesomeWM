local gears = require("gears")
local function set_wallpaper(s, theme, wallpaper_file)
    local wallpaper = theme.walls_dir .. "/" .. wallpaper_file
    
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
end

return set_wallpaper