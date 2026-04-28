--[[
	PlaceType.luau
	
	Defines and manages different place types in the game.
	Handles place identification and expected player counts for different game modes.
--]]

local SharedModuleDirectory = require(game:GetService("ReplicatedStorage").SharedModuleDirectory)
local RemoteEventHandler = require(SharedModuleDirectory.RemoteEventHandler)

local PlaceType = {}

export type PlaceType = "Lobby" | "Solo"

local PLACE_IDS = {
    Lobby = 76729145725505,
    Solo = 106553847928100
}

local expectedPlayers = {
    Solo = 2,
}

function PlaceType.expectedPlayers()
    local placeType = PlaceType.getType()
    return expectedPlayers[placeType]
end

function PlaceType.getType() : PlaceType
    local currentPlaceId = game.PlaceId
    
    if currentPlaceId == PLACE_IDS.Lobby then
        return "Lobby"
    elseif currentPlaceId == PLACE_IDS.Solo then
        return "Solo"
    else
        warn("Unknown PlaceId:", currentPlaceId, "- Defaulting to Lobby")
        return "Lobby"
    end
end

function PlaceType.getLobbyId() : number
    return PLACE_IDS.Lobby
end

function PlaceType.getSoloId() : number
    return PLACE_IDS.Solo
end

return PlaceType