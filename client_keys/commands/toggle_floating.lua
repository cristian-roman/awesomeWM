return require("awful").key(
    
    -- key combination
    { require("variables").modkey }, "l",
    
    -- function
    awful.client.floating.toggle,
    
    -- description & group
    {description = "toggle floating", group = "client"}
)