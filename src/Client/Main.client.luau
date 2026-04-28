--[[
	Main.client.luau
	
	Client entry point script that initializes the client-side application.
	This script runs when a player joins the game.
--]]

local Root = game.Players.LocalPlayer.PlayerScripts
local QueryLoaded = game:GetService("ReplicatedStorage"):WaitForChild("QueryLoaded")
local SharedModuleDirectory = require(game:GetService("ReplicatedStorage").SharedModuleDirectory)

local isServerLoaded = false
while isServerLoaded == false do
	isServerLoaded = QueryLoaded:InvokeServer()
	print(isServerLoaded)
	task.wait(0.1)
end

local ClientLoader = require(Root.Core.ClientLoader)
ClientLoader.init()
local RemoteEventHandler = require(SharedModuleDirectory.RemoteEventHandler)
ClientLoader.profileLoaded()
RemoteEventHandler.FireOnServer("PLAYER_LOADED")

