return require("awful").key(
    
    -- key_combination
    { require("variables").modkey }, "Left",   
    
    -- function
    awful.tag.viewprev, 
    
    -- description & group
    {description = "view previous", group = "tag"}
)
