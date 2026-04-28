--[[
	ResourceManager.luau
	
	Manages and caches shared resources and assets.
	Provides utilities for finding and managing game resources.
--]]

local sharedRoot = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local ResourceManager = {}

local cache = {}

local function isBaseTagged(instance: Instance)
	return instance:HasTag("ignore_desc")
end

local function descFound(desc: Instance)
	-- Skip if this is a child of a BASE/Base tagged instance
	local parent = desc.Parent
	while parent and parent ~= sharedRoot do
		if isBaseTagged(parent) then
			return -- Don't cache children of BASE/Base tagged instances
		end
		parent = parent.Parent
	end
	
	if desc.ClassName ~= "Folder" then
		cache[desc.Name] = desc
	end
end

function ResourceManager.init()
	sharedRoot.DescendantAdded:Connect(descFound)

	for _, eachDesc in pairs(sharedRoot:GetDescendants()) do
		descFound(eachDesc)
	end
end

function ResourceManager.getResource(resourceName: string, waitTime: number? , defaultValue : any?)
	
	print(cache)
	local inst = cache[resourceName]
	if inst then return inst end

	local timeout = waitTime or 0
	
	-- Return immediately if timeout is 0 and resource not found
	if timeout == 0 then
		return defaultValue
	end
	
	local start = os.clock()

	repeat
		task.wait()
		inst = cache[resourceName]
	until inst or (os.clock() - start) > timeout

	if inst == nil then
		return defaultValue
	end

	return inst
end


return ResourceManager
