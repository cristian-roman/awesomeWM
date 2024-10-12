local awful = require("awful")
local beautiful = require("beautiful")
local wallpaper_set_function = require("helpers.wallpaper_set_function")

awful.screen.connect_for_each_screen(
    function(s)
        awful.util.tagnames = { "一", "二", "三", "四", "五" }
        beautiful.at_screen_connect(s)
    end
)

screen.connect_signal("request::wallpaper", wallpaper_set_function)