return require("awful").key(
    
    -- key combination
    { require("variables").modkey, "Control" }, "r",
    
    -- function
    awesome.restart, 
    
    -- description & group
    {description = "reload awesome", group = "awesome"}
)
