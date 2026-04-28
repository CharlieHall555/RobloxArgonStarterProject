--[[
	StringUtil.luau
	
	Utility module for string operations and formatting.
	Provides functions for date/time formatting, string manipulation, etc.
--]]

local StringUtil = {}

-- Converts a Unix timestamp into a readable local time string
-- Example output: "11 Jan 2026, 18:42"
function StringUtil.formatUnixTime(input: number): string
	if input <= 0 then
		return "N/A"
	end

	local dateTable = os.date("*t", input)

	return string.format(
		"%02d %s %04d, %02d:%02d",
		dateTable.day,
		os.date("%b", input),
		dateTable.year,
		dateTable.hour,
		dateTable.min
	)
end

-- Converts remaining time in seconds into a readable countdown string
-- Example outputs:
-- 3661  -> "1h 1m 1s"
-- 90    -> "1m 30s"
-- 12    -> "12s"
function StringUtil.formatRemainingTime(input: number): string
	if input <= 0 then
		return "0s"
	end

	local seconds = math.floor(input)

	local days = math.floor(seconds / 86400)
	seconds -= days * 86400

	local hours = math.floor(seconds / 3600)
	seconds -= hours * 3600

	local minutes = math.floor(seconds / 60)
	seconds -= minutes * 60

	local parts = {}

	if days > 0 then
		table.insert(parts, days .. "d")
	end
	if hours > 0 then
		table.insert(parts, hours .. "h")
	end
	if minutes > 0 then
		table.insert(parts, minutes .. "m")
	end
	if seconds > 0 or #parts == 0 then
		table.insert(parts, seconds .. "s")
	end

	return table.concat(parts, " ")
end

return StringUtil
