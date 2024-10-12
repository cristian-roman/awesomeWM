return require("awful").key(
    
    -- key combination
    { require("variables").modkey, "Control" }, "c",
    
    -- function
    awesome.quit, 
    
    -- description & group
    {description = "quit awesome", group = "awesome"}
)
