--[[
	SharedModuleDirectory.luau
	
	Central directory for all shared module references (Client & Server).
	Provides organized access to utilities and resources used across both contexts.
	
	Example Import:
		local SharedModuleDirectory = require(game:GetService("ReplicatedStorage").SharedModuleDirectory)
--]]

local sharedRoot = game:GetService("ReplicatedStorage")

local SharedModuleDirectory = {}

--Example Import of SharedModuleDirectory:
--local SharedModuleDirectory = require(game:GetService("ReplicatedStorage").SharedModuleDirectory)

SharedModuleDirectory.ResourceManager = sharedRoot.ResourceManager

SharedModuleDirectory.Utilities = {}
SharedModuleDirectory.Utilities.PhysicsUtil = sharedRoot.Utilities.PhysicsUtil
SharedModuleDirectory.Utilities.VectorUtil = sharedRoot.Utilities.VectorUtil
SharedModuleDirectory.Utilities.PlaceType = sharedRoot.Utilities.PlaceType
SharedModuleDirectory.Utilities.Logger = sharedRoot.Utilities.Logger
SharedModuleDirectory.Utilities.Queue = sharedRoot.Utilities.Queue
SharedModuleDirectory.Utilities.Set = sharedRoot.Utilities.Set
SharedModuleDirectory.Utilities.StringUtil = sharedRoot.Utilities.StringUtil
SharedModuleDirectory.Utilities.SystemMessage = sharedRoot.Utilities.SystemMessage
SharedModuleDirectory.Utilities.Timer = sharedRoot.Utilities.Timer
SharedModuleDirectory.Utilities.ListUtil = sharedRoot.Utilities.ListUtil

SharedModuleDirectory.Data = {}
SharedModuleDirectory.Data.Questions = sharedRoot.Data.Questions




return SharedModuleDirectory