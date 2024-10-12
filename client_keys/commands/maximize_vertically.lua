return require("awful").key(
    
    --key combination
    { require("variables").modkey, "Control" }, "v",
    
    --function
    function (c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end,

    --description & group
    {description = "(un)maximize vertically", group = "client"}
)