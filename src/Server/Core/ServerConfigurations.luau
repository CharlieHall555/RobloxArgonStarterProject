--[[
	ServerConfigurations.luau
	
	Central configuration module for server-side settings.
	Contains game constants like group ID, physics settings, and gameplay parameters.
--]]

local ServerConfiguration = {}

local Configuration : Configuration?
local config = {}

function ServerConfiguration.setupConfig(configTable : {})
    config = configTable
end

function ServerConfiguration.init()
    
    if not config or next(config) == nil then
        error("ServerConfiguration: Config must be set before module loader is initialized. Call setupConfig() first.")
    end
    
    Configuration = Instance.new("Configuration")
    Configuration.Name = "Config"
    Configuration.Parent = workspace
    for valueName , eachValue in config do     
        Configuration:SetAttribute(valueName , eachValue)
    end

    Configuration.AttributeChanged:Connect(function(attribute)
        
        local newValue = Configuration:GetAttribute(attribute)
        ServerConfiguration.updateConfig(attribute , newValue)

    end)


end

function ServerConfiguration.get(valueName : string)
    return config[valueName]
end

function ServerConfiguration.updateConfig(valueName : string , newValue : any?)
    config[valueName] = newValue
    Configuration:SetAttribute(valueName , newValue)  
end

return ServerConfiguration