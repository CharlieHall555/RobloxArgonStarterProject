--[[
	ClientModuleDirectory.luau
	
	Central directory for all client-side module references.
	Provides easy access to core client modules and utilities.
	
	Example Import:
		local ClientModuleDirectory = require(game.Players.LocalPlayer.PlayerScripts.ClientModuleDirectory)
--]]

local Root = game.Players.LocalPlayer.PlayerScripts
local sharedRoot = game:GetService("ReplicatedStorage")
local ClientModuleDirectory = {}

--Example Import of ClientModuleDirectory:
--local ClientModuleDirectory = require(game.Players.LocalPlayer.PlayerScripts.ClientModuleDirectory)

--//====================================================
--// Core
--//====================================================
ClientModuleDirectory.ClientEventHandler = Root.Core.ClientEventHandler

return ClientModuleDirectory

