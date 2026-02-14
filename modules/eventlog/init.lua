--------------------------------------------------------
-- Cool Events Log / init.lua
--------------------------------------------------------

local Event = require 'Event' -- This is for calling events, I guess

local LOG_DIR  = "user://mods/eventlog" -- idk if this line is needed but it works and I'm not touching it anymore
local LOG_PATH = "user://mods/eventlog/event_log.txt" -- location of the log file obv

local function log(msg)
    local f, err = io.open(LOG_PATH, "w") -- change this to "a" if you want to append instead of overwrite
    f:write(msg .. "\n") -- \n is next line in case you changed w to a. Remove \n if the empty line below is a problem
    f:close()
end

------------
-- COOL EVENTS
------------

Event.Register("onGameStart", function() -- when the game starts
    log("Welcome back, pilot") -- I made it human readable, but you can change it to whatever you want it to say.
end)

Event.Register("onShipLanded", function(ship, body) -- Ship is not docking to a station but landing in the wilderness. Needs both "ship" and "body" to know where you landed
        log("Landed on " .. body.label)  -- Your ship landed on "planetary body name". 
end)

Event.Register("onShipTakeoff", function(ship, body) -- Ship took off from wilderness (not a station, not even a planetary station)
        log("Taking off from " .. body.label)
end)

Event.Register("onShipDocked", function(ship, station) -- When ship docks to a station in space or on planet
        log("Welcome to " .. station.label)
end)

Event.Register("onShipUndocked", function(ship, station) -- When ship undocks from a station
        log("Undocked from " .. station.label)
end)

Event.Register("onEnterHyperspace", function(ship, target) -- Entered hyperspace
        log("Hyperspace to " .. target.path:GetStarSystem().name)
end)

Event.Register("onEnterSystem", function(ship) -- Left hyperspace
        log("Entered " .. Game.system.name)
end)

Event.Register("onShipCollided", function(ship, other) -- Your ship got hit in the wallet
        log("HIT!")
end)

Event.Register("onJettison", function(ship, cargo) -- You dumped stuff out of the ship
        log("Jettisoned " .. cargo:GetName())
end)
