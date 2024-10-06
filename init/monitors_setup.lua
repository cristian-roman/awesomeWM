local awful = require("awful")
awful.screen.connect_for_each_screen(
    function(s)
        awful.util.tagnames = { "一", "二", "三", "四", "五" }
        require("beautiful").at_screen_connect(s)
    end
)

screen.connect_signal("request::wallpaper", require("helpers.wallpaper_set_function"))
