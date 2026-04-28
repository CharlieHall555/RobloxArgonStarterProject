--[[
	ServerModuleDirectory.luau
	
	Central directory for all server-side module references.
	Provides organized access to core systems, services, and game modules.
	
	Example Import:
		local ServerModuleDirectory = require(game:GetService("ServerScriptService").ServerModuleDirectory)
--]]

local serverRoot = game:GetService("ServerScriptService")

--Example Import of ServerModuleDirectory:
--local ServerModuleDirectory = require(game:GetService("ServerScriptService").ServerModuleDirectory)

local ServerModuleDirectory = {}

--//====================================================
--// Core Scripts
--//====================================================

ServerModuleDirectory.ServerEventHandler = serverRoot.Core.ServerEventHandler
ServerModuleDirectory.ValueBinder = serverRoot.Core.ValueBinder
ServerModuleDirectory.Config = serverRoot.Core.ServerConfigurations
ServerModuleDirectory.ServerStatus = serverRoot.Core.ServerStatus

return ServerModuleDirectory
