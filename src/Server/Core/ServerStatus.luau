
--[[
	ServerStatus.luau
	
	Tracks and manages the current server status state.
	Monitors whether the server is loading, running, or shutting down.
--]]

local ServerStatus = {}

export type Status = "LOADING" | "OK" | "SHUTTING_DOWN"

local status = "OK"
local serverLoaded = false

function ServerStatus.init()
    
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local QueryLoaded = ReplicatedStorage:FindFirstChild("QueryLoaded")
    
    if not QueryLoaded then
        warn("ServerStatus: RemoteFunction 'QueryLoaded' not found in ReplicatedStorage. Creating it now.")
        QueryLoaded = Instance.new("RemoteFunction")
        QueryLoaded.Name = "QueryLoaded"
        QueryLoaded.Parent = ReplicatedStorage
    end
    
    QueryLoaded.OnServerInvoke = function(player)
        return serverLoaded
    end
    
    game:BindToClose(function()
        status = "SHUTTING_DOWN"
    end)

end

function ServerStatus.setLoaded(loaded: boolean)
    serverLoaded = loaded
end

function ServerStatus.set(newStatus : string)

    status = newStatus
    
end

function ServerStatus.get()
    return status
end



return ServerStatus