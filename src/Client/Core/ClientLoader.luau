--[[
	ClientLoader.luau
	
	Responsible for safely loading and initializing all client modules.
	Provides utilities to require modules with error handling and dependency tracking.
--]]

local Root = script.Parent.Parent

local ClientModuleDirectory = require(Root.ClientModuleDirectory)
local SharedModuleDirectory = require(game:GetService("ReplicatedStorage").SharedModuleDirectory)

local EventHandler = require(ClientModuleDirectory.ClientEventHandler)

local ClientLoader = {}

local loaded: { [string]: any } = {}

local function safeRequire(moduleName: string, moduleScript: ModuleScript): any
	local ok, result = pcall(require, moduleScript)
	if not ok then
		error(("Module: %s failed to load, Reason: %s"):format(moduleName, tostring(result)))
	end
	return result
end

local function requireAll(tbl: { [any]: any })
	for key, entry in pairs(tbl) do
		if type(entry) == "table" then
			requireAll(entry)
		else
			local moduleName = tostring(key)
			local moduleScript = entry :: ModuleScript

			local result = safeRequire(moduleName, moduleScript)
			if result then
				if loaded[moduleName] then
					warn(("Duplicate module name '%s' overwriting previous entry."):format(moduleName))
				end

				loaded[moduleName] = result

				local initFn = result.init
				if type(initFn) == "function" then
					initFn()
				end
			end
		end
	end
end

local function runOnLoadedOnce()
	for moduleName, moduleTbl in pairs(loaded) do
		local onLoadedFn = moduleTbl.onLoaded
		if type(onLoadedFn) == "function" then
			onLoadedFn()
		end
	end
end

function ClientLoader.init()
	requireAll(ClientModuleDirectory)
	requireAll(SharedModuleDirectory)

	runOnLoadedOnce()

	EventHandler.FireEvent("ClientLoaded")
	print("[CLIENT] all modules loaded.")
end

function ClientLoader.profileLoaded()
	for _, moduleTbl in pairs(loaded) do
		local fn = moduleTbl.onProfileLoaded
		if type(fn) == "function" then
			fn()
		end
	end
end

return ClientLoader
