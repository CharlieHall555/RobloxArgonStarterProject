--[[
	Main.server.luau
	
	Server entry point script that initializes the game server.
	Manages server state, loads all server modules, and handles server lifecycle.
--]]

local ServerLoader = require(game:GetService("ServerScriptService").Core.ServerLoader)
local ServerStatus = require(game:GetService("ServerScriptService").Core.ServerStatus)

ServerStatus.init()
ServerLoader.init()
ServerStatus.setLoaded(true)
ServerStatus.set("loaded")

local ServerModuleDirectory = require(game:GetService("ServerScriptService").ServerModuleDirectory)
local SharedModuleDirectory = require(game:GetService("ReplicatedStorage").SharedModuleDirectory)


