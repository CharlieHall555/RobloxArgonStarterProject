--[[
	Logger.luau
	
	Centralized logging utility with category-based visibility control.
	Provides structured logging with configurable output filtering.
--]]

local Logger = {}

local default_visible = {
    MATCHMAKING = true,
    UNKNOWN = true
}

local visibility_settings = {}

function Logger.setVisible(category : string, visible : boolean) 
    visibility_settings[category] = visible
end

function Logger.logPrint(message : string, category : string?)
    category = category or "UNKNOWN"
    category = string.upper(category)
    
    local is_visible = visibility_settings[category]
    if is_visible == nil then
        is_visible = default_visible[category]
    end
    if is_visible == nil then
        is_visible = false
    end
    
    if is_visible then
        print("[" .. category .. "]", message)
    end
end

function Logger.logWarn(message : string, category : string?)
    category = category or "UNKNOWN"
    category = string.upper(category)
    
    local is_visible = visibility_settings[category]
    if is_visible == nil then
        is_visible = default_visible[category]
    end
    if is_visible == nil then
        is_visible = false
    end
    
    if is_visible then
        warn("[" .. category .. "]", message)
    end
end

return Logger