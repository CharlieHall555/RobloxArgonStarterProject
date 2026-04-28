--[[
	SystemMessage.luau
	
	Handles system messages and chat notifications.
	Provides utilities for displaying system messages to players.
--]]

local RunService = game:GetService("RunService")
local ChatService = game:GetService("TextChatService")
local SystemMessage = {}

local EventHandler
local ServerModuleDirectory

function SystemMessage.ReceiveMessage(Message: string, MessageColor: Color3): nil
	assert(RunService:IsClient(), "Cannot be run from server.")

	local TextChannel: TextChannel = ChatService.TextChannels.RBXGeneral
	assert(TextChannel, "text channel missing.")
	TextChannel:DisplaySystemMessage(Message)
end

function SystemMessage.init()
	if RunService:IsServer() then
		ServerModuleDirectory = require(game:GetService("ServerScriptService"):WaitForChild("ServerModuleDirectory") , 5)
        EventHandler = require(ServerModuleDirectory.RemoteEventHandler)

	else
		ServerModuleDirectory = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("ClientModuleDirectory") , 5)
        EventHandler = require(ServerModuleDirectory.RemoteEventHandler)
        EventHandler.newEventConnection("SendMessage", SystemMessage.ReceiveMessage)
	end
    EventHandler = require(ServerModuleDirectory.RemoteEventHandler)

    assert(EventHandler , "EventHandler missing.")
    assert(ServerModuleDirectory , "ServerModuleDirectory missing.")

end

function SystemMessage.SendMessageToClient(Client: Player, Message: string, MessageColor: Color3): nil
	assert(RunService:IsServer(), "Cannot be run from client.")
	EventHandler.FireOnClient("SendMessage", Message, MessageColor)
end

function SystemMessage.SendMessageToAllClients(Message: string, MessageColor: Color3): nil
	assert(RunService:IsServer(), "Cannot be run from client.")
	EventHandler.FireOnAllClients("SendMessage", Message, MessageColor)
end

return SystemMessage
