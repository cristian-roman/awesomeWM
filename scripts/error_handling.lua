local naughty = require("naughty")

local function init()
    
    if awesome.startup_errors then
        naughty.notify(
            { 
                preset = naughty.config.presets.critical,
                title = "Oops, there were errors during startup!",
                text = awesome.startup_errors 
            }
        )
    end

    -- Handle runtime errors after startup
    do
        local in_error = false
        
        awesome.connect_signal("debug::error", 
            function (err)
                -- Make sure we don't go into an endless error loop
                if 
                    in_error then return
                else                 
                    in_error = true
                end
                naughty.notify({ preset = naughty.config.presets.critical,
                                title = "Oops, an error happened at runtime!",
                                text = tostring(err) })
                in_error = false
            end
        )
    end
end


return
{
    init = init
} 