return require("awful").key(
    
    -- key combination
    { require("variables").modkey }, "Tab", 
    
    -- function
    awful.tag.history.restore, 
    
    -- description & group
    {description = "go back", group = "tag"}
)
