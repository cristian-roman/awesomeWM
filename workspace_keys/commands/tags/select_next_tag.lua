return require("awful").key(
    
    --key combination
    { require("variables").modkey }, "Right",   
    
    --function
    awful.tag.viewnext, 
    
    --description & group
    {description = "view next", group = "tag"}
)
