return require("awful").key(
    
    -- key combination
    {require("variables").modkey, "Shift"}, "h", 
    
    -- function
    require("awful.hotkeys_popup").show_help, 
    
    -- description & group
    {description="show help", group="awesome"}
)
